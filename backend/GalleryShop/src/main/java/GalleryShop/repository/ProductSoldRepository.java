package GalleryShop.repository;

import GalleryShop.model.ProductSold;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface ProductSoldRepository extends JpaRepository<ProductSold, Long> {

    @Query(value = "select * from product_sold p " +
            "inner join sale s ON s.product_sold_id = p.id " +
            "inner join account_client c ON c.id = s.account_client_id " +
            "where s.date_sale = CURRENT_DATE and c.client_id = ? and p.description = ?", nativeQuery = true)
    Optional<ProductSold> findByProductSoldIdClientDescription(Long id, String description);


    @Query(value = "select * from product_sold p " +
            "inner join sale s ON s.product_sold_id = p.id " +
            "inner join account_employee c ON c.id = s.account_employee_id " +
            "where s.date_sale = CURRENT_DATE and c.employee_id = ? and p.description = ?", nativeQuery = true)
    Optional<ProductSold> findByProductSoldIdEmployeeDescription(Long id, String description);


}
