package GalleryShop.repository;

import GalleryShop.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long> {
    Optional<Product> findByDescriptionIgnoreCase(String description);
}
