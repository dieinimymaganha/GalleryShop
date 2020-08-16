package GalleryShop.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import GalleryShop.model.Schedule;

public interface ScheduleRepository extends JpaRepository<Schedule, Long>{

    
}