package GalleryShop.controller.form;

import java.util.Date;
import java.util.Optional;

import com.fasterxml.jackson.annotation.JsonFormat;

import GalleryShop.model.Employee;
import GalleryShop.model.Schedule;
import GalleryShop.model.Enum.DayOfTheWeek;
import GalleryShop.repository.EmployeeRepository;

public class ScheduleForm {

    private Long employeeId;

    @JsonFormat(pattern="dd/MM/yyyy")
    private Date day;
    
    private DayOfTheWeek dayOfTheWeek;
    
    
    private Date earlyMorningJourney;
    
    
    private Date endMorningJourney;
    
    
    private Date earlyAfternoonJourney;
    
    
    private Date endJourneyLate;

    private Integer attendanceTime;

    public ScheduleForm(Long employeeId, Date day, DayOfTheWeek dayOfTheWeek, Date earlyMorningJourney,
            Date endMorningJourney, Date earlyAfternoonJourney, Date endJourneyLate, Boolean available,
            Integer attendanceTime) {
        this.employeeId = employeeId;
        this.day = day;
        this.dayOfTheWeek = dayOfTheWeek;
        this.earlyMorningJourney = earlyMorningJourney;
        this.endMorningJourney = endMorningJourney;
        this.earlyAfternoonJourney = earlyAfternoonJourney;
        this.endJourneyLate = endJourneyLate;
        this.attendanceTime = attendanceTime;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(Date day) {
        this.day = day;
    }

    public DayOfTheWeek getDayOfTheWeek() {
        return dayOfTheWeek;
    }

    public void setDayOfTheWeek(DayOfTheWeek dayOfTheWeek) {
        this.dayOfTheWeek = dayOfTheWeek;
    }

    public Date getEarlyMorningJourney() {
        return earlyMorningJourney;
    }

    public void setEarlyMorningJourney(Date earlyMorningJourney) {
        this.earlyMorningJourney = earlyMorningJourney;
    }

    public Date getEndMorningJourney() {
        return endMorningJourney;
    }

    public void setEndMorningJourney(Date endMorningJourney) {
        this.endMorningJourney = endMorningJourney;
    }

    public Date getEarlyAfternoonJourney() {
        return earlyAfternoonJourney;
    }

    public void setEarlyAfternoonJourney(Date earlyAfternoonJourney) {
        this.earlyAfternoonJourney = earlyAfternoonJourney;
    }

    public Date getEndJourneyLate() {
        return endJourneyLate;
    }

    public void setEndJourneyLate(Date endJourneyLate) {
        this.endJourneyLate = endJourneyLate;
    }


    public Integer getAttendanceTime() {
        return attendanceTime;
    }

    public void setAttendanceTime(Integer attendanceTime) {
        this.attendanceTime = attendanceTime;
    }

    public Schedule converter(EmployeeRepository employeeRepository) {
        Optional<Employee> employee = employeeRepository.findById(employeeId);
        Employee employeeRecuver = employee.get();
        return new Schedule(employeeRecuver, day, dayOfTheWeek, earlyMorningJourney, endMorningJourney,
                earlyAfternoonJourney, endJourneyLate, attendanceTime);

    }

}