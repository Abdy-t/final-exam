package attractor.exam12.demo.service;

import attractor.exam12.demo.dto.CafeDTO;
import attractor.exam12.demo.dto.UserRegistrationForm;
import attractor.exam12.demo.model.*;
import attractor.exam12.demo.repository.CafeRepository;
import attractor.exam12.demo.repository.ImageRepository;
import attractor.exam12.demo.repository.Repository;
import attractor.exam12.demo.repository.ReviewRepository;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;
import org.springframework.web.multipart.MultipartFile;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.util.Collections;
import java.util.List;

@org.springframework.stereotype.Service
@AllArgsConstructor

public class Service {
    private Repository repository;
    private CafeRepository cafeRepository;
    private ImageRepository imageRepository;
    private ReviewRepository reviewRepository;

    private final PasswordEncoder encoder;

    public boolean existsByEmail(String email) {
        return repository.existsByEmail(email);
    }

    public boolean hasFieldErrors(BindingResult validationResult) {
        return validationResult.hasFieldErrors();
    }

    public void registration(UserRegistrationForm form) {
        User user = User.builder()
                .email(form.getEmail())
                .name(form.getName())
                .password(encoder.encode(form.getPassword()))
                .roles(Collections.singleton(Role.USER))
                .build();

        repository.save(user);
    }

    public Page<CafeDTO> getAllCafes(Pageable pageable) {
        return cafeRepository.findAll(pageable).map(CafeDTO::from);
    }

    public Cafe getCafe(int id) {
        var cafe = cafeRepository.findById(id).get();
        cafe.setRating(averageSum(cafe.getId()));
        return cafe;
    }

    public List<Review> getReviews(int id) {
        return reviewRepository.findAllByCafe(cafeRepository.findById(id).get());
    }
    public User getUserByEmail(String email) {
        return repository.findByEmail(email);
    }
    public float averageSum(int id) {
        List<Review> reviews = reviewRepository.findAllByCafe(cafeRepository.findById(id).get());
        float sum = 0;
        float average = 0;
        for (Review value : reviews) {
            sum += value.getRating();
        }
        average = sum / reviews.size();
        return  average;
    }
    public void addReview(int cafe_id, String review, float rating, String user) {
        User usr = getUserByEmail(user);
        Review newReview = Review.builder()
                .text(review)
                .date(LocalDate.now().toString())
                .user(usr)
                .cafe(cafeRepository.findById(cafe_id).get())
                .rating(rating)
                .user_name(usr.getEmail())
                .build();
        reviewRepository.save(newReview);
    }
    public void addCafe(MultipartFile file, String title, String description) throws Exception {
        saveImage(file);
        Cafe newCafe = Cafe.builder()
                .title(title)
                .description(description)
                .build();
        cafeRepository.save(newCafe);
        addImage(file, newCafe);
    }

    public void deleteReview(String id) {
        reviewRepository.delete(reviewRepository.findById(Integer.parseInt(id)).get());
    }

    public void addImage(MultipartFile file, Cafe cafe) throws Exception {
        saveImage(file);
        Image image = Image.builder()
                .path(file.toString())
                .cafe(cafe)
                .build();
        imageRepository.save(image);
    }

    public void saveImage(MultipartFile file) throws Exception{
        String folder = "../images/";
        byte[] bytes = file.getBytes();
        Path path = Paths.get(folder + file.getOriginalFilename());
        Files.write(path, bytes);
    }


}
