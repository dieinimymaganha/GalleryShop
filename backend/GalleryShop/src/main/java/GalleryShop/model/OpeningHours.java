package GalleryShop.model;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

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
    private @Temporal(TemporalType.TIME) Date earlyMorningJourney;
    private @Temporal(TemporalType.TIME) Date endMorningJourney;
    private @Temporal(TemporalType.TIME) Date earlyAfternoonJourney;
    private @Temporal(TemporalType.TIME) Date endJourneyLate;

    public OpeningHours(final Employee employee, final DayOfTheWeek dayOfTheWeek, final Date earlyMorningJourney,
            final Date endMorningJourney, final Date earlyAfternoonJourney, final Date endJourneyLate) {
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

    public Date getEarlyMorningJourney() {
        return earlyMorningJourney;
    }

    public void setEarlyMorningJourney(final Date earlyMorningJourney) {
        this.earlyMorningJourney = earlyMorningJourney;
    }

    public Date getEndMorningJourney() {
        return endMorningJourney;
    }

    public void setEndMorningJourney(final Date endMorningJourney) {
        this.endMorningJourney = endMorningJourney;
    }

    public Date getEarlyAfternoonJourney() {
        return earlyAfternoonJourney;
    }

    public void setEarlyAfternoonJourney(final Date earlyAfternoonJourney) {
        this.earlyAfternoonJourney = earlyAfternoonJourney;
    }

    public Date getEndJourneyLate() {
        return endJourneyLate;
    }

    public void setEndJourneyLate(final Date endJourneyLate) {
        this.endJourneyLate = endJourneyLate;
    }

    public OpeningHours() {
    }

}