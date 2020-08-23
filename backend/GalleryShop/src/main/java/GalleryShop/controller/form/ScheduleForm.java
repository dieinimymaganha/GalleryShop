package GalleryShop.controller.form;

import java.time.LocalTime;
import java.time.format.TextStyle;
import java.time.temporal.TemporalAccessor;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Optional;

import com.fasterxml.jackson.annotation.JsonFormat;

import GalleryShop.model.Employee;
import GalleryShop.model.OpeningHours;
import GalleryShop.model.Schedule;
import GalleryShop.model.TypeEmployee;
import GalleryShop.model.Enum.DayOfTheWeek;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.OpeningHoursRepository;
import GalleryShop.repository.TypeEmployeeRepository;

public class ScheduleForm {

    private Long employeeId;

    private Long typeEmployeeId;

    @JsonFormat(pattern = "dd/MM/yyyy")
    private Date day;

    private LocalTime attendanceTime;

    private LocalTime startAttendance;

    private LocalTime endAttendance;

    private Boolean available;

    public ScheduleForm(final Long employeeId, final Long typeEmployeeId, final Date day,
            final LocalTime attendanceTime, final LocalTime startAttendance, final LocalTime endAttendance,
            final Boolean available) {
        this.employeeId = employeeId;
        this.typeEmployeeId = typeEmployeeId;
        this.day = day;
        this.attendanceTime = attendanceTime;
        this.startAttendance = startAttendance;
        this.endAttendance = endAttendance;
        this.available = available;
    }

    public Long getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(final Long employeeId) {
        this.employeeId = employeeId;
    }

    public Long getTypeEmployeeId() {
        return typeEmployeeId;
    }

    public void setTypeEmployeeId(final Long typeEmployeeId) {
        this.typeEmployeeId = typeEmployeeId;
    }

    public Date getDay() {
        return day;
    }

    public void setDay(final Date day) {
        this.day = day;
    }

    public LocalTime getAttendanceTime() {
        return attendanceTime;
    }

    public void setAttendanceTime(final LocalTime attendanceTime) {
        this.attendanceTime = attendanceTime;
    }

    public LocalTime getStartAttendance() {
        return startAttendance;
    }

    public void setStartAttendance(final LocalTime startAttendance) {
        this.startAttendance = startAttendance;
    }

    public LocalTime getEndAttendance() {
        return endAttendance;
    }

    public void setEndAttendance(final LocalTime endAttendance) {
        this.endAttendance = endAttendance;
    }

    public Boolean getAvailable() {
        return available;
    }

    public void setAvailable(final Boolean available) {
        this.available = available;
    }

    public Schedule convert(final EmployeeRepository employeeRepository,
            final OpeningHoursRepository openingHoursRepository, final TypeEmployeeRepository typeEmployeeRepository) {

        final DayOfTheWeek weekRecover = identifyDayOfWeek(day);

        final List<OpeningHours> openingHoursRecover = openingHoursRepository.findByEmployeeId(employeeId);

        OpeningHours openingHoursCreate = new OpeningHours();

        for (final OpeningHours openingHours : openingHoursRecover) {
            if (openingHours.getDayOfTheWeek() == weekRecover) {
                OpeningHours create = openingHours;
                final int tempoAtendimento = attendanceTime.toSecondOfDay()
                        + create.getEarlyMorningJourney().toSecondOfDay();
                final String time2 = extracted(tempoAtendimento);
                System.out.println("Tempo calculado >>>> " + time2);

            }
        }

        // System.out.println("Ta aqui >>>>>>>> " + openingHoursCreate.toString());

        // Optional<Employee> employee = employeeRepository.findById(employeeId);

        // Optional<TypeEmployee> typeEmployee =
        // typeEmployeeRepository.findById(typeEmployeeId);

        // if (employee.isPresent() || openingHours.isPresent() ||
        // typeEmployee.isPresent()) {
        // return new Schedule(employee.get(), openingHours.get(), typeEmployee.get(),
        // day, attendanceTime,
        // startAttendance, endAttendance, available);

        // }
        return null;

    }

    private String extracted(final int tempo) {
        final LocalTime timeOfDay = LocalTime.ofSecondOfDay(tempo);
        final String time = timeOfDay.toString();
        return time;
    }

    public DayOfTheWeek identifyDayOfWeek(final Date data) {
        final Calendar calendar = Calendar.getInstance();

        calendar.setTime(data);
        final int dayWeek = calendar.get(Calendar.DAY_OF_WEEK);

        DayOfTheWeek week;
        switch (dayWeek) {
            case 1:
                week = DayOfTheWeek.DOMINGO;
                break;
            case 2:
                week = DayOfTheWeek.SEGUNDA;
                break;
            case 3:
                week = DayOfTheWeek.TERCA;
                break;
            case 4:
                week = DayOfTheWeek.QUARTA;
                break;
            case 5:
                week = DayOfTheWeek.QUINTA;
                break;
            case 6:
                week = DayOfTheWeek.SEXTA;
                break;
            case 7:
                week = DayOfTheWeek.SABADO;
                break;
            default:
                week = DayOfTheWeek.DOMINGO;
                break;

        }

        // System.out.println("Semana >>>" + week);
        return week;

    }

}