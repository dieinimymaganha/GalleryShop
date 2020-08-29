package GalleryShop.model;

import java.time.LocalTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import GalleryShop.model.Enum.DayOfTheWeek;

@Entity
public class OpeningHours {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne()
    @JoinColumn(name = "employee_id")
    private Employee employee;
    private DayOfTheWeek dayOfTheWeek;


    private LocalTime earlyMorningJourney;

    
    private LocalTime endMorningJourney;

    
    private LocalTime earlyAfternoonJourney;

    
    private LocalTime endJourneyLate;

    public OpeningHours(final Employee employee, final DayOfTheWeek dayOfTheWeek, final LocalTime earlyMorningJourney,
            final LocalTime endMorningJourney, final LocalTime earlyAfternoonJourney, final LocalTime endJourneyLate) {
        this.employee = employee;
        this.dayOfTheWeek = dayOfTheWeek;
        this.earlyMorningJourney = earlyMorningJourney;
        this.endMorningJourney = endMorningJourney;
        this.earlyAfternoonJourney = earlyAfternoonJourney;
        this.endJourneyLate = endJourneyLate;
    }

    public Long getId() {
        return id;
    }

    public void setId(final Long id) {
        this.id = id;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(final Employee employee) {
        this.employee = employee;
    }

    public DayOfTheWeek getDayOfTheWeek() {
        return dayOfTheWeek;
    }

    public void setDayOfTheWeek(final DayOfTheWeek dayOfTheWeek) {
        this.dayOfTheWeek = dayOfTheWeek;
    }

    public LocalTime getEarlyMorningJourney() {
        return earlyMorningJourney;
    }

    public void setEarlyMorningJourney(final LocalTime earlyMorningJourney) {
        this.earlyMorningJourney = earlyMorningJourney;
    }

    public LocalTime getEndMorningJourney() {
        return endMorningJourney;
    }

    public void setEndMorningJourney(final LocalTime endMorningJourney) {
        this.endMorningJourney = endMorningJourney;
    }

    public LocalTime getEarlyAfternoonJourney() {
        return earlyAfternoonJourney;
    }

    public void setEarlyAfternoonJourney(final LocalTime earlyAfternoonJourney) {
        this.earlyAfternoonJourney = earlyAfternoonJourney;
    }

    public LocalTime getEndJourneyLate() {
        return endJourneyLate;
    }

    public void setEndJourneyLate(final LocalTime endJourneyLate) {
        this.endJourneyLate = endJourneyLate;
    }

    public OpeningHours() {
    }

    @Override
    public String toString() {
        return "OpeningHours [dayOfTheWeek=" + dayOfTheWeek + ", earlyAfternoonJourney=" + earlyAfternoonJourney
                + ", earlyMorningJourney=" + earlyMorningJourney + ", employee=" + employee + ", endJourneyLate="
                + endJourneyLate + ", endMorningJourney=" + endMorningJourney + ", id=" + id + "]";
    }


    

}