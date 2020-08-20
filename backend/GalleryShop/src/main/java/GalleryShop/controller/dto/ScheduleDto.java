package GalleryShop.controller.dto;

import java.time.LocalTime;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import com.fasterxml.jackson.annotation.JsonFormat;

import GalleryShop.model.Schedule;

public class ScheduleDto {

    private Long id;

    private String employee;
    private Long employeeId;

    private String client;
    private Long clientId;

    private String openingHours;
	@JsonFormat(pattern="dd/MM/yyyy")
    private Date day;

    private String typeEmployee;

    private LocalTime attendanceTime;

    private LocalTime startAttendance;

    private LocalTime endAttendance;

    private Boolean available;

    public ScheduleDto(final Schedule schedule) {
        this.id = schedule.getId();
        this.employee = schedule.getEmployee().getName();
        this.employeeId = schedule.getEmployee().getId();
        this.typeEmployee = schedule.getTypeEmployee().getDescription();
        this.client = schedule.getClient().getName();
        this.clientId = schedule.getClient().getId();
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

    public String getEmployee() {
        return employee;
    }

    public void setEmployee(String employee) {
        this.employee = employee;
    }

    public String getClient() {
        return client;
    }

    public void setClient(String client) {
        this.client = client;
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

    public static List<ScheduleDto> converter(final List<Schedule> schedules) {
        return schedules.stream().map(ScheduleDto::new).collect(Collectors.toList());
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(Long employeeId) {
        this.employeeId = employeeId;
    }

    public Long getClientId() {
        return clientId;
    }

    public void setClientId(Long clientId) {
        this.clientId = clientId;
    }

    public String getTypeEmployee() {
        return typeEmployee;
    }

    public void setTypeEmployee(String typeEmployee) {
        this.typeEmployee = typeEmployee;
    }

}