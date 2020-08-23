package GalleryShop.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import GalleryShop.model.OpeningHours;
import GalleryShop.model.Enum.DayOfTheWeek;

public interface OpeningHoursRepository extends JpaRepository<OpeningHours, Long> {

    OpeningHours findByDayOfTheWeek(DayOfTheWeek dayOfTheWeek);

    List<OpeningHours> findByEmployeeId(Long id);

}