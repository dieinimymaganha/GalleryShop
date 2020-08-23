package GalleryShop.model;

import java.time.LocalTime;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Schedule {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "employee_id", referencedColumnName = "id")
    private Employee employee;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "opening_hours_id", referencedColumnName = "id")
    private OpeningHours openingHours;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "type_employee_id", referencedColumnName = "id")
    private TypeEmployee typeEmployee;

    private @Temporal(TemporalType.DATE) Date day;

    private LocalTime attendanceTime;

    private LocalTime startAttendance;

    private LocalTime endAttendance;

    private Boolean available;

    public Schedule(Employee employee, OpeningHours openingHours, TypeEmployee typeEmployee, Date day,
            LocalTime attendanceTime, LocalTime startAttendance, LocalTime endAttendance, Boolean available) {
        this.employee = employee;
        this.openingHours = openingHours;
        this.typeEmployee = typeEmployee;
        this.day = day;
        this.attendanceTime = attendanceTime;
        this.startAttendance = startAttendance;
        this.endAttendance = endAttendance;
        this.available = available;
    }

    public Schedule() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }

    public OpeningHours getOpeningHours() {
        return openingHours;
    }

    public void setOpeningHours(OpeningHours openingHours) {
        this.openingHours = openingHours;
    }

    public TypeEmployee getTypeEmployee() {
        return typeEmployee;
    }

    public void setTypeEmployee(TypeEmployee typeEmployee) {
        this.typeEmployee = typeEmployee;
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

    @Override
    public String toString() {
        return "Schedule [attendanceTime=" + attendanceTime + ", available=" + available + ", day=" + day
                + ", employee=" + employee + ", endAttendance=" + endAttendance + ", openingHours=" + openingHours
                + ", startAttendance=" + startAttendance + ", typeEmployee=" + typeEmployee + "]";
    }

    

}