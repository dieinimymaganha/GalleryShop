package GalleryShop.repository;

import GalleryShop.model.Sale;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface SaleRepository extends JpaRepository<Sale, Long> {

    @Query(value = "select * from sale inner join " +
            "product_sold on product_sold.id = sale.product_sold_id " +
            "where product_sold_id = ?", nativeQuery = true)
    Optional<Sale> findByProductSoldId(Long id);

    List<Sale> findByClientId(Long id);
}
