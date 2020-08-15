package attractor.exam12.demo.controller;

import attractor.exam12.demo.dto.CafeForm;
import attractor.exam12.demo.dto.UserRegistrationForm;
import attractor.exam12.demo.model.Cafe;
import attractor.exam12.demo.service.Service;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.awt.*;
import java.io.File;
import java.util.Optional;

@org.springframework.stereotype.Controller
@AllArgsConstructor
public class Controller {

    private Service service;

    @GetMapping
    public String main(Model model, @PageableDefault(value = 20) Pageable pageable, Authentication authentication) {
        model.addAttribute("page", service.getAllCafes(pageable));
        model.addAttribute("url", "/");
        if (authentication != null) {
            model.addAttribute("user", authentication.getAuthorities());
        }
        return "main-page";
    }

    @GetMapping("/login")
    public String login(@RequestParam(required = false, defaultValue = "false") Boolean error, Model model) {
        model.addAttribute("error", error);
        return "sign-in";
    }

    @GetMapping("/registration")
    public String registration(Model model) {
        if (!model.containsAttribute("dto")) {
            model.addAttribute("dto", new UserRegistrationForm());
        }
        return "sign-up";
    }

    @PostMapping("/registration")
    public String registration(@Valid UserRegistrationForm form, BindingResult validationResult, RedirectAttributes attributes) {
        if (service.hasFieldErrors(validationResult)) {
            attributes.addFlashAttribute("errors", validationResult.getFieldErrors());
            return "redirect:/registration";
        }
        if (service.existsByEmail(form.getEmail())) {
            attributes.addFlashAttribute("errorEmail", "Пользователь с таким адресом почты уже зарегистрован!");
            return "redirect:/registration";
        }
        service.registration(form);
        return "redirect:/login";
    }

    @GetMapping("/cafe/{id}")
    public String getCafe(@PathVariable("id") int id, Model model, Authentication authentication) {
        Cafe cafe = service.getCafe(id);
        model.addAttribute("cafe", cafe);
        if (cafe.getImages().size() > 1)
            model.addAttribute("images", cafe.getImages());
        model.addAttribute("reviews", service.getReviews(id));
        model.addAttribute("img", cafe.getImages().get(0).getPath());
        model.addAttribute("user", service.getUserByEmail(authentication.getName()));
        model.addAttribute("sum", service.averageSum(id));

        return "cafe";
    }
    @GetMapping("/addCafe")
    public String addCafe(Model model, Authentication authentication) {
        if (authentication != null)
            model.addAttribute("user", authentication.getAuthorities());
        model.addAttribute("cafe", new CafeForm());
        return "add-cafe";
    }
    @PostMapping("/addReview")
    public String addReview(@RequestParam int cafe_id, String review, float rating, Authentication authentication) {
        service.addReview(cafe_id, review, rating, authentication.getName());
        return "redirect:/cafe/" + cafe_id;
    }
    @PostMapping("/deleteReview")
    public String deleteReview(@RequestParam String review_id, int cafe_id) {
        service.deleteReview(review_id);
        return "redirect:/cafe/" + cafe_id;
    }

    @RequestMapping(value = "/addCafes", method = RequestMethod.POST)
    public String addCafes(@RequestParam String title, String description, MultipartFile image) {
        try {
            service.addCafe(image, title, description);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "redirect:/addCafe";
    }

    @RequestMapping(value = "/addImage", method = RequestMethod.POST)
    public String addImage(@RequestParam String cafe_id, MultipartFile image) {
        try {
            service.addImage(image, service.getCafe(Integer.parseInt(cafe_id)));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return "redirect:/cafe/" + cafe_id;
    }
}
