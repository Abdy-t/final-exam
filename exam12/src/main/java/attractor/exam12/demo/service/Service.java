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
        var reviews = reviewRepository.findAllByCafe_Id(id);
        float sum = 0;
        float average = 0;
        for (int i = 0; i < reviews.size(); i++) {
            sum += reviews.get(i).getRating();
        }
        average = sum / reviews.size();
        var cafe = cafeRepository.findById(id).get();
        cafe.setRating(average);
        cafeRepository.save(cafe);
        return cafe;
    }

    public List<Review> getReviews(int id) {
        return reviewRepository.findAllByCafe_Id(id);
    }
    public User getUserByEmail(String email) {
        return repository.findByEmail(email);
    }
    public void addReview(int cafe_id, String review, float rating, String user) {
        System.out.println(" Rating " + cafe_id + review+ rating);
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
    public void addCafe(String title, String description, String path) {
        Cafe newCafe = Cafe.builder()
                .title(title)
                .description(description)
                .build();

        Image image = Image.builder()
                .path(path)
                .cafe(newCafe)
                .build();

        cafeRepository.save(newCafe);
        imageRepository.save(image);
    }
    public void deleteReview(String id) {
        reviewRepository.delete(reviewRepository.findById(Integer.parseInt(id)).get());
    }
    public void saveImage(MultipartFile file, String title, String description) throws Exception{
        String folder = "C:/Users/tabyl/OneDrive/Рабочий стол/final-exam/images/";
        byte[] bytes = file.getBytes();
        Path path = Paths.get(folder + file.getOriginalFilename());
        Files.write(path, bytes);
        addCafe(title, description, path.toString());






//        BufferedImage img = null;
//        try {
//            System.out.println(file.getName());
//            System.out.println(file.getResource().isFile());
////            System.out.println(file.ge);
//            img = new BufferedImage(200, 200, BufferedImage.TYPE_INT_ARGB);
//            img = ImageIO.read((File) file);
//            ByteArrayOutputStream baos = new ByteArrayOutputStream();
//            ImageIO.write(img, "jpg", baos);
//            System.out.println("succes read");
//
//        } catch (Exception ex) {
//
//        }
//
//        try {
//            System.out.println(String.valueOf(file));
//            File f = new File(String.valueOf(file));
//            ImageIO.write(img, "jpg", f);
//            System.out.println("succes write");
//        } catch (Exception ex) {
//
//        }
//        BufferedImage img = null;
//        img = ImageIO.read((File) file);
//        ByteArrayOutputStream baos = new ByteArrayOutputStream();
//        ImageIO.write(img, "jpg", baos);
//        baos.flush();
//
//        byte[] bytes = baos.toByteArray();
//        baos.close();
//
//        String fileName = StringUtils.cleanPath(file.getOriginalFilename());
//        try {
//            Image image = new Image(fileName,file.getContentType(),file.getBytes());
//            imageRepository.save(image);
//        } catch (IOException e) {
//            System.out.println(e);
//        }
    }
}
