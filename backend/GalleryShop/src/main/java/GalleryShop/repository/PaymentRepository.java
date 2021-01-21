package GalleryShop.repository;

import GalleryShop.model.Payment;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

public interface PaymentRepository extends JpaRepository<Payment, Long> {
    List<Payment> findByAccountClientId(Long id);

    @Query(value = "select * from payment where account_client_id = ? " +
            "and date_payment = ? order by date_payment", nativeQuery = true)
    List<Payment> findByAccountClientIDAndDatePayment(Long id, Date date);
}
