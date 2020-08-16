package GalleryShop.model;

import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import GalleryShop.model.Enum.DayOfTheWeek;

@Entity
public class Schedule {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @ManyToOne()
    @JoinColumn(name = "employee_id")
    private Employee employee;
    private Date day;
    private DayOfTheWeek dayOfTheWeek;
    private Date earlyMorningJourney;
    private Date endMorningJourney;
    private Date earlyAfternoonJourney;
    private Date endJourneyLate;
    private Integer attendanceTime;

    public Schedule(final Employee employee, final Date day, final DayOfTheWeek dayOfTheWeek,
            final Date earlyMorningJourney, final Date endMorningJourney, final Date earlyAfternoonJourney,
            final Date endJourneyLate, final Integer attendanceTime) {
        this.employee = employee;
        this.day = day;
        this.dayOfTheWeek = dayOfTheWeek;
        this.earlyMorningJourney = earlyMorningJourney;
        this.endMorningJourney = endMorningJourney;
        this.earlyAfternoonJourney = earlyAfternoonJourney;
        this.endJourneyLate = endJourneyLate;
        this.attendanceTime = attendanceTime;
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

    public Date getDay() {
        return day;
    }

    public void setDay(final Date day) {
        this.day = day;
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

    public Integer getAttendanceTime() {
        return attendanceTime;
    }

    public void setAttendanceTime(final Integer attendanceTime) {
        this.attendanceTime = attendanceTime;
    }

    public Schedule() {
    }

}