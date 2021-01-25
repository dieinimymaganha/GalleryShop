package GalleryShop.repository;

import GalleryShop.model.ProductSold;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface ProductSoldRepository extends JpaRepository<ProductSold, Long> {

    @Query(value = "select * from product_sold inner join sale "  +
            "on product_sold.id = sale.product_sold_id " +
            "where sale.date_sale = CURRENT_DATE and product_sold.description = ?", nativeQuery = true)
    Optional<ProductSold> findByProductSoldDescription(String description);

}
