package GalleryShop.controller.form;

import java.time.LocalTime;
import java.util.Date;
import java.util.Optional;

import com.fasterxml.jackson.annotation.JsonFormat;

import GalleryShop.model.Employee;
import GalleryShop.model.OpeningHours;
import GalleryShop.model.Schedule;
import GalleryShop.model.TypeEmployee;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.OpeningHoursRepository;
import GalleryShop.repository.TypeEmployeeRepository;

public class ScheduleForm {

    private Long employeeId;

    private Long openingHoursId;

    private Long typeEmployeeId;

    @JsonFormat(pattern = "dd/MM/yyyy")
    private Date day;

    private LocalTime attendanceTime;

    private LocalTime startAttendance;

    private LocalTime endAttendance;

    private Boolean available;

    public ScheduleForm(Long employeeId, Long openingHoursId, Long typeEmployeeId, Date day, LocalTime attendanceTime,
            LocalTime startAttendance, LocalTime endAttendance, Boolean available) {
        this.employeeId = employeeId;
        this.openingHoursId = openingHoursId;
        this.typeEmployeeId = typeEmployeeId;
        this.day = day;
        this.attendanceTime = attendanceTime;
        this.startAttendance = startAttendance;
        this.endAttendance = endAttendance;
        this.available = available;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public Long getOpeningHoursId() {
        return openingHoursId;
    }

    public void setOpeningHoursId(Long openingHoursId) {
        this.openingHoursId = openingHoursId;
    }

    public Long getTypeEmployeeId() {
        return typeEmployeeId;
    }

    public void setTypeEmployeeId(Long typeEmployeeId) {
        this.typeEmployeeId = typeEmployeeId;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public LocalTime getAttendanceTime() {
        return attendanceTime;
    }

    public void setAttendanceTime(LocalTime attendanceTime) {
        this.attendanceTime = attendanceTime;
    }

    public LocalTime getStartAttendance() {
        return startAttendance;
    }

    public void setStartAttendance(LocalTime startAttendance) {
        this.startAttendance = startAttendance;
    }

    public LocalTime getEndAttendance() {
        return endAttendance;
    }

    public void setEndAttendance(LocalTime endAttendance) {
        this.endAttendance = endAttendance;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(Boolean available) {
        this.available = available;
    }

    public Schedule convert(EmployeeRepository employeeRepository, OpeningHoursRepository openingHoursRepository,
            TypeEmployeeRepository typeEmployeeRepository) {

        Optional<Employee> employee = employeeRepository.findById(employeeId);
        Optional<OpeningHours> openingHours = openingHoursRepository.findById(openingHoursId);
        Optional<TypeEmployee> typeEmployee = typeEmployeeRepository.findById(typeEmployeeId);

        if (employee.isPresent() || openingHours.isPresent() || typeEmployee.isPresent()) {
            return new Schedule(employee.get(), openingHours.get(), typeEmployee.get(), day, attendanceTime,
                    startAttendance, endAttendance, available);

        }
        return null;

    }

}