package GalleryShop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import GalleryShop.model.Appointment;

public interface AppointmentRepository extends JpaRepository<Appointment, Long>{
    
}