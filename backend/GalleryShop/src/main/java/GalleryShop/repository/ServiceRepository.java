package GalleryShop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import GalleryShop.model.Service;

public interface ServiceRepository extends JpaRepository<Service, Long> {

}