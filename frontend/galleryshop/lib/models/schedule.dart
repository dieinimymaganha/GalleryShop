import 'client.dart';

class ScheduleDto {
  int id;
  int employeeId;
  String nicknameEmployee;
  String openingHours;
  String day;
  String typeEmployee;
  String attendanceTime;
  String startAttendance;
  String endAttendance;
  bool available;

  ScheduleDto(
      {this.id,
        this.employeeId,
        this.nicknameEmployee,
        this.openingHours,
        this.day,
        this.typeEmployee,
        this.attendanceTime,
        this.startAttendance,
        this.endAttendance,
        this.available});

  ScheduleDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employeeId'];
    nicknameEmployee = json['nicknameEmployee'];
    openingHours = json['openingHours'];
    day = json['day'];
    typeEmployee = json['typeEmployee'];
    attendanceTime = json['attendanceTime'];
    startAttendance = json['startAttendance'];
    endAttendance = json['endAttendance'];
    available = json['available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employeeId'] = this.employeeId;
    data['nicknameEmployee'] = this.nicknameEmployee;
    data['openingHours'] = this.openingHours;
    data['day'] = this.day;
    data['typeEmployee'] = this.typeEmployee;
    data['attendanceTime'] = this.attendanceTime;
    data['startAttendance'] = this.startAttendance;
    data['endAttendance'] = this.endAttendance;
    data['available'] = this.available;
    return data;
  }
}

class ScheduleAppointmentForm {
  int clientId;
  bool avaliable;

  ScheduleAppointmentForm({this.clientId, this.avaliable});

  ScheduleAppointmentForm.fromJson(Map<String, dynamic> json) {
    clientId = json['clientId'];
    avaliable = json['avaliable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientId'] = this.clientId;
    data['avaliable'] = this.avaliable;
    return data;

  }

  @override
  String toString() {
    return 'ScheduleAppointmentForm{clientId: $clientId, avaliable: $avaliable}';
  }
}


class ScheduleDtoAppointment {
  int id;
  int employeeId;
  String nicknameEmployee;
  String openingHours;
  String day;
  String typeEmployee;
  String attendanceTime;
  String startAttendance;
  String endAttendance;
  bool available;
  int clientId;
  String clientName;
  ClientDto clientDto;

  ScheduleDtoAppointment(
      {this.id,
        this.employeeId,
        this.nicknameEmployee,
        this.openingHours,
        this.day,
        this.typeEmployee,
        this.attendanceTime,
        this.startAttendance,
        this.endAttendance,
        this.available,
        this.clientId,
        this.clientName,
        this.clientDto});

  ScheduleDtoAppointment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employeeId = json['employeeId'];
    nicknameEmployee = json['nicknameEmployee'];
    openingHours = json['openingHours'];
    day = json['day'];
    typeEmployee = json['typeEmployee'];
    attendanceTime = json['attendanceTime'];
    startAttendance = json['startAttendance'];
    endAttendance = json['endAttendance'];
    available = json['available'];
    clientId = json['clientId'];
    clientName = json['clientName'];
    clientDto = json['clientDto'] != null
        ? new ClientDto.fromJson(json['clientDto'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employeeId'] = this.employeeId;
    data['nicknameEmployee'] = this.nicknameEmployee;
    data['openingHours'] = this.openingHours;
    data['day'] = this.day;
    data['typeEmployee'] = this.typeEmployee;
    data['attendanceTime'] = this.attendanceTime;
    data['startAttendance'] = this.startAttendance;
    data['endAttendance'] = this.endAttendance;
    data['available'] = this.available;
    data['clientId'] = this.clientId;
    data['clientName'] = this.clientName;
    if (this.clientDto != null) {
      data['clientDto'] = this.clientDto.toJson();
    }
    return data;
  }
}

class ScheduleEnableScheduleForm {
  String attendanceTime;
  bool available;
  String day;
  int employeeId;
  int typeEmployeeId;
  int quantityDays;

  ScheduleEnableScheduleForm(
      {this.attendanceTime,
        this.available,
        this.day,
        this.employeeId,
        this.typeEmployeeId,
        this.quantityDays});

  ScheduleEnableScheduleForm.fromJson(Map<String, dynamic> json) {
    attendanceTime = json['attendanceTime'];
    available = json['available'];
    day = json['day'];
    employeeId = json['employeeId'];
    typeEmployeeId = json['typeEmployeeId'];
    quantityDays = json['quantityDays'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attendanceTime'] = this.attendanceTime;
    data['available'] = this.available;
    data['day'] = this.day;
    data['employeeId'] = this.employeeId;
    data['typeEmployeeId'] = this.typeEmployeeId;
    data['quantityDays'] = this.quantityDays;
    return data;
  }
}