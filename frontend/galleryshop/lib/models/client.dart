import 'package:galleryshop/models/profile.dart';

class ClientForm {
  String name;
  String lastName;
  String nickname;
  String cpf;
  String birthDate;
  String phoneNumber;
  String email;
  String password;
  List<ListProfiles> listProfiles;

  ClientForm(
      {this.name,
      this.lastName,
      this.nickname,
      this.cpf,
      this.birthDate,
      this.phoneNumber,
      this.email,
      this.password,
      this.listProfiles});

  ClientForm.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastName = json['lastName'];
    nickname = json['nickname'];
    cpf = json['cpf'];
    birthDate = json['birthDate'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
    if (json['listProfiles'] != null) {
      listProfiles = new List<ListProfiles>();
      json['listProfiles'].forEach((v) {
        listProfiles.add(new ListProfiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    data['nickname'] = this.nickname;
    data['cpf'] = this.cpf;
    data['birthDate'] = this.birthDate;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['password'] = this.password;
    if (this.listProfiles != null) {
      data['listProfiles'] = this.listProfiles.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'ClientModelForm{name: $name, lastName: $lastName, nickname: $nickname, cpf: $cpf, birthDate: $birthDate, phoneNumber: $phoneNumber, email: $email, password: $password, listProfiles: $listProfiles}';
  }
}

class ClientDto {
  int id;
  String name;
  String lastName;
  String nickname;
  String cpf;
  String birthdate;
  String phoneNumber;
  String email;
  String password;

  ClientDto(this.id, this.name, this.lastName, this.nickname, this.cpf,
      this.birthdate, this.phoneNumber, this.email, this.password);

  ClientDto.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    lastName = json['lastName'];
    nickname = json['nickname'];
    cpf = json['cpf'];
    birthdate = json['birthdate'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['lastName'] = this.lastName;
    data['nickname'] = this.nickname;
    data['cpf'] = this.cpf;
    data['birthdate'] = this.birthdate;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}
