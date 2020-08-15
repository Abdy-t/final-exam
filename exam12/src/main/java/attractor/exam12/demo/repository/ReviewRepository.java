package attractor.exam12.demo.repository;

import attractor.exam12.demo.model.Cafe;
import attractor.exam12.demo.model.Review;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ReviewRepository extends JpaRepository<Review, Integer> {
    @Query("select r from Review as r order by r.id desc")
    List<Review> findAllByCafe(Cafe cafe);
}
