package exam12.demo.controller;

import exam12.demo.dto.UserRegistrationForm;
import exam12.demo.service.Service;
import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@org.springframework.stereotype.Controller
@AllArgsConstructor
public class Controller {

    private Service service;

    @GetMapping
    public String main(Model model) {
        model.addAttribute("cafes", service.getAllCafes());
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
}
