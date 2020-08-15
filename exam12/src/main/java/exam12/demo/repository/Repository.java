package exam12.demo.repository;

import exam12.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface Repository extends JpaRepository<User, Integer> {

    boolean existsByEmail(String email);
}
