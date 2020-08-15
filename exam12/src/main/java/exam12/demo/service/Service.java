package exam12.demo.service;

import exam12.demo.dto.UserRegistrationForm;
import exam12.demo.model.Cafe;
import exam12.demo.model.Role;
import exam12.demo.model.User;
import exam12.demo.repository.CafeRepository;
import exam12.demo.repository.Repository;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.BindingResult;

import java.util.Collections;

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
        User user = User.builder()
                .email(form.getEmail())
                .name(form.getName())
                .password(encoder.encode(form.getPassword()))
                .roles(Collections.singleton(Role.USER))
                .build();

        repository.save(user);
    }

    public Page<Cafe> getAllCafes(Pageable pageable) {
        return cafeRepository.findAll(pageable);
    }
}
