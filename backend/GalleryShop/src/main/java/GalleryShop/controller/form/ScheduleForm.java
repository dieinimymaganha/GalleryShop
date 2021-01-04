package GalleryShop.controller.form;

import GalleryShop.model.Employee;
import GalleryShop.model.Enum.DayOfTheWeek;
import GalleryShop.model.OpeningHours;
import GalleryShop.model.Schedule;
import GalleryShop.model.TypeEmployee;
import GalleryShop.repository.EmployeeRepository;
import GalleryShop.repository.OpeningHoursRepository;
import GalleryShop.repository.ScheduleRepository;
import GalleryShop.repository.TypeEmployeeRepository;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.ZoneId;
import java.util.*;

public class ScheduleForm {

    private Long employeeId;

    private Long typeEmployeeId;

    private @Temporal(TemporalType.DATE)
    Date day;

    private LocalTime attendanceTime;

    private LocalTime startAttendance;

    private LocalTime endAttendance;

    private Boolean available;

    private Long quantityDays;

    public ScheduleForm(final Long employeeId, final Long typeEmployeeId, final Date day,
                        final LocalTime attendanceTime, final LocalTime startAttendance, final LocalTime endAttendance,
                        final Boolean available, final Long quantityDays) {
        this.employeeId = employeeId;
        this.typeEmployeeId = typeEmployeeId;
        this.day = day;
        this.attendanceTime = attendanceTime;
        this.startAttendance = startAttendance;
        this.endAttendance = endAttendance;
        this.available = available;
        this.quantityDays = quantityDays;
    }

    public Long getQuantityDays() {
        return quantityDays;
    }

    public void setQuantityDays(Long quantityDays) {
        this.quantityDays = quantityDays;
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
                                  final OpeningHoursRepository openingHoursRepository, final TypeEmployeeRepository typeEmployeeRepository, final ScheduleRepository scheduleRepository) {

        LocalDate localDate = LocalDate.now();
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> localDate: " + localDate);
        System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>: " + day);

        List<LocalDate> listDays = CreateListDates(quantityDays);

        List<Schedule> listSchedules = new ArrayList<>();

        Optional<TypeEmployee> typeEmployee = typeEmployeeRepository.findById(typeEmployeeId);

        Optional<Employee> employee = employeeRepository.findById(employeeId);

        for (LocalDate dateVerify : listDays) {

            Date dayFinal = convertToDateViaInstant(dateVerify);

            List<Schedule> listReturn = scheduleRepository.findByEmployeeIdAndDay(employeeId, dayFinal);

            System.out.println(">>>>>>>>>>><<<<<<<<<<<<<<<" + listReturn);

            if (listReturn.isEmpty()) {

                final DayOfTheWeek weekRecover = identifyDayOfWeek(dayFinal);

                final List<OpeningHours> openingHoursRecover = openingHoursRepository.findByEmployeeId(employeeId);

                String hourCollectMorning = null;
                LocalTime dateIniMorning = null;

                String hourCollectAfternoon = null;
                LocalTime dateIniAfternoon = null;
                int dateSeconds = 0;
                for (OpeningHours openingHours : openingHoursRecover) {
                    if (openingHours.getDayOfTheWeek() == weekRecover) {
                        final OpeningHours create = openingHours;

                        if (create.getEarlyMorningJourney() != null && create.getEndMorningJourney() != null) {
                            int convertedAttendanceTime = attendanceTime.toSecondOfDay();
                            int morningAttendanceTime = create.getEndMorningJourney().toSecondOfDay()
                                    - create.getEarlyMorningJourney().toSecondOfDay();

                            int serviceQuantityMorning = (morningAttendanceTime / convertedAttendanceTime);

                            int answeringTimeSecondsMorning = morningAttendanceTime / serviceQuantityMorning;

                            for (int hoursCalculate = create.getEarlyMorningJourney()
                                    .toSecondOfDay(); hoursCalculate <= create.getEndMorningJourney()
                                    .toSecondOfDay(); hoursCalculate = hoursCalculate
                                    + answeringTimeSecondsMorning) {

                                hourCollectMorning = extracted(hoursCalculate);
                                dateIniMorning = LocalTime.parse(hourCollectMorning);

                                dateSeconds = hoursCalculate + answeringTimeSecondsMorning;

                                LocalTime dateFimMorning = LocalTime.parse(extracted(dateSeconds));

                                if (dateFimMorning.isBefore(create.getEndMorningJourney())
                                        || dateFimMorning.equals(create.getEndMorningJourney())) {

                                    Schedule scheduleCreate = new Schedule(employee.get(), create, typeEmployee.get(), dayFinal,
                                            attendanceTime, dateIniMorning, dateFimMorning, available);

                                    listSchedules.add(scheduleCreate);

                                }

                            }

                        }

                        if (create.getEarlyAfternoonJourney() != null && create.getEndJourneyLate() != null) {
                            int convertedAttendanceTime = attendanceTime.toSecondOfDay();
                            int afternoonAttendanceTime = create.getEndMorningJourney().toSecondOfDay()
                                    - create.getEarlyMorningJourney().toSecondOfDay();

                            int serviceQuantityAfternoon = (afternoonAttendanceTime / convertedAttendanceTime);

                            int answeringTimeSecondsMorning = afternoonAttendanceTime / serviceQuantityAfternoon;

                            for (int hoursCalculate = create.getEarlyAfternoonJourney()
                                    .toSecondOfDay(); hoursCalculate <= create.getEndJourneyLate()
                                    .toSecondOfDay(); hoursCalculate = hoursCalculate
                                    + answeringTimeSecondsMorning) {

                                hourCollectAfternoon = extracted(hoursCalculate);
                                dateIniAfternoon = LocalTime.parse(hourCollectAfternoon);

                                dateSeconds = hoursCalculate + answeringTimeSecondsMorning;

                                LocalTime dateFimAfternoon = LocalTime.parse(extracted(dateSeconds));

                                if (dateFimAfternoon.isBefore(create.getEndJourneyLate())
                                        || dateFimAfternoon.equals(create.getEndJourneyLate())) {

                                    Schedule schedulecreate = new Schedule(employee.get(), create, typeEmployee.get(), dayFinal,
                                            attendanceTime, dateIniAfternoon, dateFimAfternoon, available);
                                    listSchedules.add(schedulecreate);


                                }

                            }

                        }

                    }

                }

            }

        }

//        System.out.println("Lista de agenda >>>>>" + listSchedules);

        return listSchedules;
//        return null;

    }

    private List<LocalDate> CreateListDates(Long quantityDays) {
        List<LocalDate> listDates = new ArrayList<>();

//        quantityDays = quantityDays - 1;
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

    public Date convertToDateViaInstant(LocalDate dateToConvert) {
        return java.util.Date.from(dateToConvert.atStartOfDay()
                .atZone(ZoneId.systemDefault())
                .toInstant());
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