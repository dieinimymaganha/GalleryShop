package GalleryShop.controller.dto;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;



import GalleryShop.model.OpeningHours;
import GalleryShop.model.Enum.DayOfTheWeek;

public class OpeningHoursDto {
    private Long id;

    private String employee;
    private DayOfTheWeek dayOfTheWeek;

    private LocalTime earlyMorningJourney;

    private LocalTime endMorningJourney;

    private LocalTime earlyAfternoonJourney;

    private LocalTime endJourneyLate;

    public OpeningHoursDto(final OpeningHours schedule) {
        this.id = schedule.getId();
        this.employee = schedule.getEmployee().getName();
        this.dayOfTheWeek = schedule.getDayOfTheWeek();
        this.earlyMorningJourney = schedule.getEarlyMorningJourney();
        this.endMorningJourney = schedule.getEndMorningJourney();
        this.earlyAfternoonJourney = schedule.getEarlyAfternoonJourney();
        this.endJourneyLate = schedule.getEndJourneyLate();

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmployee() {
        return employee;
    }

    public void setEmployee(String employee) {
        this.employee = employee;
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

    public static List<OpeningHoursDto> converter(List<OpeningHours> schedules) {
        return schedules.stream().map(OpeningHoursDto::new).collect(Collectors.toList());
    }

}