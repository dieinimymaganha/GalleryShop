package GalleryShop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import GalleryShop.model.Schedule;

public interface ScheduleRepository extends JpaRepository<Schedule, Long> {

    List<Schedule> findByEmployeeId(Long id);

}