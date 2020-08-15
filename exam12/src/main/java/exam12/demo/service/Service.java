package exam12.demo.service;

import exam12.demo.dto.UserRegistrationForm;
import exam12.demo.model.Cafe;
import exam12.demo.model.Role;
import exam12.demo.model.User;
import exam12.demo.repository.CafeRepository;
import exam12.demo.repository.Repository;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;

import java.util.Collections;
import java.util.List;


@org.springframework.stereotype.Service
@AllArgsConstructor

public class Service {
    private Repository repository;
    private CafeRepository cafeRepository;
    private final PasswordEncoder encoder;

    public boolean existsByEmail(String email) {
        return repository.existsByEmail(email);
    }

    public boolean hasFieldErrors(BindingResult validationResult) {
        return validationResult.hasFieldErrors();
    }

    public void registration(UserRegistrationForm form) {
        System.out.println("--- " + form.getEmail());
        System.out.println("+++ " + form.getName());
        System.out.println("*** " + form.getPassword());

        User user = User.builder()
                .email(form.getEmail())
                .name(form.getName())
                .password(encoder.encode(form.getPassword()))
                .roles(Collections.singleton(Role.USER))
                .build();

        repository.save(user);
        System.out.println("Save user");
    }

    public List<Cafe> getAllCafes() {
        return cafeRepository.findAll();
    }
}
