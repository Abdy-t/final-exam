package attractor.exam12.demo.repository;

import attractor.exam12.demo.model.Cafe;
import attractor.exam12.demo.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Integer> {
    List<Review> findAllByCafe(Cafe cafe);
}
