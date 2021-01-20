package GalleryShop.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import GalleryShop.model.Service;

public interface ServiceRepository extends JpaRepository<Service, Long> {
    
    Optional<Service> findByDescription(String description);

    List<Service> findByTypeEmployeeId(Long id);


}