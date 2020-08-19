package GalleryShop.controller.dto;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import com.fasterxml.jackson.annotation.JsonFormat;

import GalleryShop.model.OpeningHours;
import GalleryShop.model.Enum.DayOfTheWeek;

public class OpeningHoursDto {
    private Long id;

    private String employee;
    private DayOfTheWeek dayOfTheWeek;
    @JsonFormat(pattern = "HH:mm")
    private Date earlyMorningJourney;
    @JsonFormat(pattern = "HH:mm")
    private Date endMorningJourney;
    @JsonFormat(pattern = "HH:mm")
    private Date earlyAfternoonJourney;
    @JsonFormat(pattern = "HH:mm")
    private Date endJourneyLate;

    public OpeningHoursDto(final OpeningHours schedule) {
        this.id = schedule.getId();
        this.employee = schedule.getEmployee().getName();
        this.dayOfTheWeek = schedule.getDayOfTheWeek();
        this.earlyMorningJourney = schedule.getEarlyMorningJourney();
        this.endMorningJourney = schedule.getEarlyMorningJourney();
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

	public static List<OpeningHoursDto> converter(List<OpeningHours> schedules) {
		return schedules.stream().map(OpeningHoursDto::new).collect(Collectors.toList());
	}

}