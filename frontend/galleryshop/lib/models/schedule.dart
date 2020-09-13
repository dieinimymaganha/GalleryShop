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