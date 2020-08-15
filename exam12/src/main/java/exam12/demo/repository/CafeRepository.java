package exam12.demo.repository;

import exam12.demo.model.Cafe;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CafeRepository extends JpaRepository<Cafe, Integer> {
    Page<Cafe> findAll(Pageable pageable);
}
