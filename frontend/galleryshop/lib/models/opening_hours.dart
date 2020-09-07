class OpeninigHoursDto {
  int id;
  String employee;
  String dayOfTheWeek;
  String earlyMorningJourney;
  String endMorningJourney;
  String earlyAfternoonJourney;
  String endJourneyLate;

  OpeninigHoursDto(
      {this.id,
      this.employee,
      this.dayOfTheWeek,
      this.earlyMorningJourney,
      this.endMorningJourney,
      this.earlyAfternoonJourney,
      this.endJourneyLate});

  OpeninigHoursDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    employee = json['employee'];
    dayOfTheWeek = json['dayOfTheWeek'];
    earlyMorningJourney = json['earlyMorningJourney'];
    endMorningJourney = json['endMorningJourney'];
    earlyAfternoonJourney = json['earlyAfternoonJourney'];
    endJourneyLate = json['endJourneyLate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['employee'] = this.employee;
    data['dayOfTheWeek'] = this.dayOfTheWeek;
    data['earlyMorningJourney'] = this.earlyMorningJourney;
    data['endMorningJourney'] = this.endMorningJourney;
    data['earlyAfternoonJourney'] = this.earlyAfternoonJourney;
    data['endJourneyLate'] = this.endJourneyLate;
    return data;
  }
}

class OpeningHoursForm {
  int employeeId;
  String dayOfTheWeek;
  String earlyMorningJourney;
  String endMorningJourney;
  String earlyAfternoonJourney;
  String endJourneyLate;

  OpeningHoursForm(
      {this.employeeId,
      this.dayOfTheWeek,
      this.earlyMorningJourney,
      this.endMorningJourney,
      this.earlyAfternoonJourney,
      this.endJourneyLate});

  OpeningHoursForm.fromJson(Map<String, dynamic> json) {
    employeeId = json['employeeId'];
    dayOfTheWeek = json['dayOfTheWeek'];
    earlyMorningJourney = json['earlyMorningJourney'];
    endMorningJourney = json['endMorningJourney'];
    earlyAfternoonJourney = json['earlyAfternoonJourney'];
    endJourneyLate = json['endJourneyLate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['employeeId'] = this.employeeId;
    data['dayOfTheWeek'] = this.dayOfTheWeek;
    data['earlyMorningJourney'] = this.earlyMorningJourney;
    data['endMorningJourney'] = this.endMorningJourney;
    data['earlyAfternoonJourney'] = this.earlyAfternoonJourney;
    data['endJourneyLate'] = this.endJourneyLate;
    return data;
  }
}
