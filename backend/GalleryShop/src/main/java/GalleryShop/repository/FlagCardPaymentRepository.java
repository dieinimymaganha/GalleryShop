package GalleryShop.repository;

import GalleryShop.model.FlagCardPayment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface FlagCardPaymentRepository extends JpaRepository<FlagCardPayment, Long> {

    Optional<FlagCardPayment> findByDescription(String description);

}
