package GalleryShop.controller.form;

import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.format.TextStyle;
import java.time.temporal.TemporalAccessor;
import java.util.ArrayList;
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

    public List<Schedule> convert(final EmployeeRepository employeeRepository,
            final OpeningHoursRepository openingHoursRepository, final TypeEmployeeRepository typeEmployeeRepository) {

        List<LocalDate> listDays = CreateListDates(1);

        List<Schedule> listSchedules = new ArrayList<>();

        Optional<TypeEmployee> typeEmployee = typeEmployeeRepository.findById(typeEmployeeId);

        Optional<Employee> employee = employeeRepository.findById(employeeId);

        for (LocalDate dateVerify : listDays) {
            final DayOfTheWeek weekRecover = identifyDayOfWeek(day);

            final List<OpeningHours> openingHoursRecover = openingHoursRepository.findByEmployeeId(employeeId);

            String hourColectMorning = null;
            LocalTime dateIniMorning = null;

            String hourColectAfternoon = null;
            LocalTime dateIniAfternoon = null;

            int dateSeconds = 0;
            for (OpeningHours openingHours : openingHoursRecover) {
                if (openingHours.getDayOfTheWeek() == weekRecover) {
                    final OpeningHours create = openingHours;
                    int convertedAttendanceTime = attendanceTime.toSecondOfDay();
                    int morningAttendanceTime = create.getEndMorningJourney().toSecondOfDay()
                            - create.getEarlyMorningJourney().toSecondOfDay();

                    int serviceQuantity = (morningAttendanceTime / convertedAttendanceTime);

                    int answeringTimeSeconds = morningAttendanceTime / serviceQuantity;

                    for (int hoursCalculate = create.getEarlyMorningJourney().toSecondOfDay(); hoursCalculate <= create
                            .getEndMorningJourney()
                            .toSecondOfDay(); hoursCalculate = hoursCalculate + answeringTimeSeconds) {

                        hourColectMorning = extracted(hoursCalculate);
                        dateIniMorning = LocalTime.parse(hourColectMorning);

                        dateSeconds = hoursCalculate + answeringTimeSeconds;

                        LocalTime dateFimMorning = LocalTime.parse(extracted(dateSeconds));

                        if (dateFimMorning.isBefore(create.getEndMorningJourney())
                                || dateFimMorning.equals(create.getEndMorningJourney())) {

                            Schedule schedulecreate = new Schedule(employee.get(), create, typeEmployee.get(), day,
                                    attendanceTime, dateIniMorning, dateFimMorning, available);

                            listSchedules.add(schedulecreate);
                            // System.out.println("Manhã hora ini >>>> " + dateIniMorning);
                            // System.out.println("Manhã Hora fim >>>> " + dateFimMorning);
                        }

                    }

                    for (int hoursCalculate = create.getEarlyAfternoonJourney()
                            .toSecondOfDay(); hoursCalculate <= create.getEndJourneyLate()
                                    .toSecondOfDay(); hoursCalculate = hoursCalculate + answeringTimeSeconds) {

                        hourColectAfternoon = extracted(hoursCalculate);
                        dateIniAfternoon = LocalTime.parse(hourColectAfternoon);

                        dateSeconds = hoursCalculate + answeringTimeSeconds;

                        LocalTime dateFimAfternoon = LocalTime.parse(extracted(dateSeconds));

                        if (dateFimAfternoon.isBefore(create.getEndJourneyLate())
                                || dateFimAfternoon.equals(create.getEndJourneyLate())) {
                            Schedule schedulecreate = new Schedule(employee.get(), create, typeEmployee.get(), day,
                                    attendanceTime, dateIniAfternoon, dateIniAfternoon, available);
                            listSchedules.add(schedulecreate);

                        }

                    }

                }
            }

        }

        System.out.println("Lista de agenda >>>>>" + listSchedules);

        // final OpeningHours openingHoursCreate = new OpeningHours();

        // for (final OpeningHours openingHours : openingHoursRecover) {
        // if (openingHours.getDayOfTheWeek() == weekRecover) {
        // final OpeningHours create = openingHours;
        // final int tempoAtendimento = attendanceTime.toSecondOfDay()
        // + create.getEarlyMorningJourney().toSecondOfDay();
        // final String time2 = extracted(tempoAtendimento);
        // System.out.println("Tempo calculado >>>> " + time2);
        // }
        // }

        // System.out.println("Ta aqui >>>>>>>> " + openingHoursCreate.toString());

        // if (employee.isPresent() || openingHours.isPresent() ||
        // typeEmployee.isPresent()) {
        // return new Schedule(employee.get(), openingHours.get(), typeEmployee.get(),
        // day, attendanceTime,
        // startAttendance, endAttendance, available);

        // }
        return listSchedules;

    }

    private List<LocalDate> CreateListDates(int quantityDays) {
        List<LocalDate> listDates = new ArrayList<>();
        LocalDate newDate = convertToLocalDateViaInstant(day);

        for (int x = 0; x <= quantityDays; x++) {
            LocalDate dataIncrement = newDate.plusDays(x);

            listDates.add(dataIncrement);

        }
        return listDates;
    }

    public LocalDate convertToLocalDateViaInstant(Date dateToConvert) {
        return dateToConvert.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
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