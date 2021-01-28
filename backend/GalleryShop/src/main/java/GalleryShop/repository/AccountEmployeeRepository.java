package GalleryShop.repository;

import GalleryShop.model.AccountEmployee;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface AccountEmployeeRepository extends JpaRepository<AccountEmployee, Long> {
    Optional<AccountEmployee> findByEmployeeId(Long id);
}
