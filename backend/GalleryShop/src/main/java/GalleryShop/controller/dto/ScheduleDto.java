package GalleryShop.controller.dto;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import com.fasterxml.jackson.annotation.JsonFormat;

import GalleryShop.model.Schedule;

public class ScheduleDto {

    private Long id;

    private Long employeeId;

    private String nicknameEmployee;

    private String openingHours;

    @JsonFormat(pattern = "yyyy-MM-dd")
    private Date day;

    private String typeEmployee;

    private LocalTime attendanceTime;

    private LocalTime startAttendance;

    private LocalTime endAttendance;

    private Boolean available;

    public ScheduleDto(final Schedule schedule) {
        this.id = schedule.getId();
        this.employeeId = schedule.getEmployee().getId();
        this.nicknameEmployee = schedule.getEmployee().getNickname();
        this.typeEmployee = schedule.getTypeEmployee().getDescription();
        this.openingHours = schedule.getOpeningHours().getDayOfTheWeek().toString();
        this.day = schedule.getDay();
        this.attendanceTime = schedule.getAttendanceTime();
        this.startAttendance = schedule.getStartAttendance();
        this.endAttendance = schedule.getEndAttendance();
        this.available = schedule.getAvailable();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getOpeningHours() {
        return openingHours;
    }

    public void setOpeningHours(String openingHours) {
        this.openingHours = openingHours;
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

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public String getTypeEmployee() {
        return typeEmployee;
    }

    public void setTypeEmployee(String typeEmployee) {
        this.typeEmployee = typeEmployee;
    }

    public static List<ScheduleDto> converter(final List<Schedule> schedules) {
        return schedules.stream().map(ScheduleDto::new).collect(Collectors.toList());
    }

    public static ScheduleDto converterDto(Schedule schedule) {

        return new ScheduleDto(schedule);
    }

    public String getNicknameEmployee() {
        return nicknameEmployee;
    }

    public void setNicknameEmployee(String nicknameEmployee) {
        this.nicknameEmployee = nicknameEmployee;
    }

}