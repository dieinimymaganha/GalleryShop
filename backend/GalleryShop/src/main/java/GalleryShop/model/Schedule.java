package GalleryShop.model;

import javax.persistence.*;
import java.time.LocalTime;
import java.util.Date;

@Entity
public class Schedule {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @OneToOne()
    @JoinColumn(name = "employee_id", referencedColumnName = "id")
    private Employee employee;

    @OneToOne()
    @JoinColumn(name = "opening_hours_id", referencedColumnName = "id")
    private OpeningHours openingHours;

    @OneToOne()
    @JoinColumn(name = "type_employee_id", referencedColumnName = "id")
    private TypeEmployee typeEmployee;

    @OneToOne()
    @JoinColumn(name = "client_id", referencedColumnName = "id")
    private Client client;

    private @Temporal(TemporalType.DATE)
    Date day;

    private LocalTime attendanceTime;

    private LocalTime startAttendance;

    private LocalTime endAttendance;

    private Boolean available;

    private Boolean concluded;

    private LocalTime completionTime;

    public Schedule(Employee employee, OpeningHours openingHours,
                    TypeEmployee typeEmployee,
                    Client client, Date day,
                    LocalTime attendanceTime,
                    LocalTime startAttendance,
                    LocalTime endAttendance,
                    Boolean available,
                    Boolean concluded,
                    LocalTime completionTime) {
        this.employee = employee;
        this.openingHours = openingHours;
        this.typeEmployee = typeEmployee;
        this.client = client;
        this.day = day;
        this.attendanceTime = attendanceTime;
        this.startAttendance = startAttendance;
        this.endAttendance = endAttendance;
        this.available = available;
        this.concluded = concluded;
        this.completionTime = completionTime;
    }

    public Boolean getConcluded() {
        return concluded;
    }

    public void setConcluded(Boolean concluded) {
        this.concluded = concluded;
    }

    public LocalTime getCompletionTime() {
        return completionTime;
    }

    public void setCompletionTime(LocalTime completionTime) {
        this.completionTime = completionTime;
    }

    public Schedule(Employee employee, OpeningHours openingHours, TypeEmployee typeEmployee, Client client, Date day, LocalTime attendanceTime, LocalTime startAttendance, LocalTime endAttendance, Boolean available) {
        this.employee = employee;
        this.openingHours = openingHours;
        this.typeEmployee = typeEmployee;
        this.client = client;
        this.day = day;
        this.attendanceTime = attendanceTime;
        this.startAttendance = startAttendance;
        this.endAttendance = endAttendance;
        this.available = available;
    }

    public Schedule(Employee employee, OpeningHours openingHours, TypeEmployee typeEmployee, Date day, LocalTime attendanceTime, LocalTime startAttendance, LocalTime endAttendance, Boolean available) {
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

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
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
        return "Schedule{" +
                "id=" + id +
                ", employee=" + employee +
                ", openingHours=" + openingHours +
                ", typeEmployee=" + typeEmployee +
                ", client=" + client +
                ", day=" + day +
                ", attendanceTime=" + attendanceTime +
                ", startAttendance=" + startAttendance +
                ", endAttendance=" + endAttendance +
                ", available=" + available +
                '}';
    }
}