package GalleryShop.repository;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;

import GalleryShop.model.Schedule;
import org.springframework.data.jpa.repository.Query;

public interface ScheduleRepository extends JpaRepository<Schedule, Long> {

    List<Schedule> findByEmployeeId(Long id);

    List<Schedule> findByEmployeeIdAndTypeEmployeeId(Long idEmployee, Long idTypeEmployee, Sort sort);



    @Query(value = "select * from schedule where employee_id = ? " +
            "and type_employee_id = ? and day >= Current_date order by start_attendance asc", nativeQuery = true)
    List<Schedule> findByEmployeeTypeEmployeeScheduleCurrent(Long idEmployee, Long idTypeEmployee);


    List<Schedule> findByClientId(Long id, Sort sort);

    List<Schedule> findByEmployeeIdAndAvailable(Long idEmployee, Boolean available);

    Optional<Schedule> findByClientIdAndDayAndStartAttendance(Long id, Date day, LocalTime startAttendance);

    List<Schedule> findByClientIdAndDay(Long id, Date day);

}