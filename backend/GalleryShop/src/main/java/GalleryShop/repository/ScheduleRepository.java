package GalleryShop.repository;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import GalleryShop.controller.dto.ScheduleDtoAppointment;
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

    List<Schedule> findByEmployeeIdAndTypeEmployeeIdAndAvailable(Long idEmployee,
                                                                 Long idTypeEmployee,
                                                                 Boolean available,
                                                                 Sort sort);

    Optional<Schedule> findByClientIdAndDayAndStartAttendance(Long id, Date day, LocalTime startAttendance);

    List<Schedule> findByEmployeeIdAndDay(Long idEmployee, Date day);

    List<Schedule> findByClientIdAndDay(Long id, Date day);

}