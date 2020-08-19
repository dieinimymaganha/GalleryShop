package GalleryShop.controller.form;

import java.util.Date;
import java.util.Optional;

import com.fasterxml.jackson.annotation.JsonFormat;

import GalleryShop.model.Employee;
import GalleryShop.model.OpeningHours;
import GalleryShop.model.Enum.DayOfTheWeek;
import GalleryShop.repository.EmployeeRepository;

public class OpeningHoursForm {

    private Long employeeId;

    private DayOfTheWeek dayOfTheWeek;

    @JsonFormat(pattern = "HH:mm")
    private Date earlyMorningJourney;

    @JsonFormat(pattern = "HH:mm")
    private Date endMorningJourney;

    @JsonFormat(pattern = "HH:mm")
    private Date earlyAfternoonJourney;

    @JsonFormat(pattern = "HH:mm")
    private Date endJourneyLate;

    public OpeningHoursForm(Long employeeId, DayOfTheWeek dayOfTheWeek, Date earlyMorningJourney,
            Date endMorningJourney, Date earlyAfternoonJourney, Date endJourneyLate) {
        this.employeeId = employeeId;
        this.dayOfTheWeek = dayOfTheWeek;
        this.earlyMorningJourney = earlyMorningJourney;
        this.endMorningJourney = endMorningJourney;
        this.earlyAfternoonJourney = earlyAfternoonJourney;
        this.endJourneyLate = endJourneyLate;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
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

    public OpeningHours converter(EmployeeRepository employeeRepository) {
        Optional<Employee> employee = employeeRepository.findById(employeeId);
        Employee employeeRecuver = employee.get();
        return new OpeningHours(employeeRecuver, dayOfTheWeek, earlyMorningJourney, endMorningJourney,
                earlyAfternoonJourney, endJourneyLate);

    }

}