package GalleryShop.controller.form;

import GalleryShop.model.Employee;
import GalleryShop.model.Enum.DayOfTheWeek;
import GalleryShop.model.OpeningHours;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.OpeningHoursRepository;

import java.time.LocalTime;
import java.util.Optional;

public class OpeningHoursForm {

    private Long employeeId;

    private DayOfTheWeek dayOfTheWeek;

    private LocalTime earlyMorningJourney;

    private LocalTime endMorningJourney;

    private LocalTime earlyAfternoonJourney;

    private LocalTime endJourneyLate;

    public OpeningHoursForm(Long employeeId, DayOfTheWeek dayOfTheWeek, LocalTime earlyMorningJourney,
                            LocalTime endMorningJourney, LocalTime earlyAfternoonJourney, LocalTime endJourneyLate) {
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

    public LocalTime getEarlyMorningJourney() {
        return earlyMorningJourney;
    }

    public void setEarlyMorningJourney(LocalTime earlyMorningJourney) {
        this.earlyMorningJourney = earlyMorningJourney;
    }

    public LocalTime getEndMorningJourney() {
        return endMorningJourney;
    }

    public void setEndMorningJourney(LocalTime endMorningJourney) {
        this.endMorningJourney = endMorningJourney;
    }

    public LocalTime getEarlyAfternoonJourney() {
        return earlyAfternoonJourney;
    }

    public void setEarlyAfternoonJourney(LocalTime earlyAfternoonJourney) {
        this.earlyAfternoonJourney = earlyAfternoonJourney;
    }

    public LocalTime getEndJourneyLate() {
        return endJourneyLate;
    }

    public void setEndJourneyLate(LocalTime endJourneyLate) {
        this.endJourneyLate = endJourneyLate;
    }

    public OpeningHours converter(EmployeeRepository employeeRepository) {
        Optional<Employee> employee = employeeRepository.findById(employeeId);
        if (employee.isPresent()) {
            Employee employeeRecuver = employee.get();
            return new OpeningHours(employeeRecuver, dayOfTheWeek, earlyMorningJourney, endMorningJourney,
                    earlyAfternoonJourney, endJourneyLate);
        }
        return null;

    }


    public OpeningHours upload(Long id, EmployeeRepository employeeRepository,
                               OpeningHoursRepository openingHoursRepository) {
        OpeningHours openingHours = openingHoursRepository.getOne(id);
        openingHours.setDayOfTheWeek(this.dayOfTheWeek);
        openingHours.setEarlyMorningJourney(this.earlyMorningJourney);
        openingHours.setEndMorningJourney(this.endMorningJourney);
        openingHours.setEarlyAfternoonJourney(this.earlyAfternoonJourney);
        openingHours.setEndJourneyLate(this.endJourneyLate);
        return openingHours;
    }


}