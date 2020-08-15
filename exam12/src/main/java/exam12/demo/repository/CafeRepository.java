package exam12.demo.repository;

import exam12.demo.model.Cafe;
import exam12.demo.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CafeRepository extends JpaRepository<Cafe, Integer> {
}
