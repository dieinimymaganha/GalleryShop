class ClientModelForm {
  String name;
  String lastName;
  String nickname;
  String cpf;
  String birthdate;
  String phoneNumber;
  String email;
  String password;
  List<ListProfiles> listProfiles;

  ClientModelForm(
      this.name,
      this.lastName,
      this.nickname,
      this.cpf,
      this.birthdate,
      this.phoneNumber,
      this.email,
      this.password,
      this.listProfiles);

  ClientModelForm.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    lastName = json['lastName'];
    nickname = json['nickname'];
    cpf = json['cpf'];
    birthdate = json['birthdate'];
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
    data['birthdate'] = this.birthdate;
    data['phoneNumber'] = this.phoneNumber;
    data['email'] = this.email;
    data['password'] = this.password;
    if (this.listProfiles != null) {
      data['listProfiles'] = this.listProfiles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListProfiles {
  String role;

  ListProfiles({this.role});

  ListProfiles.fromJson(Map<String, dynamic> json) {
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    return data;
  }
}

class ClientModelDto {
  int id;
  String name;
  String lastName;
  String nickname;
  String cpf;
  String birthdate;
  String phoneNumber;
  String email;
  String password;

  ClientModelDto(
      {this.id,
      this.name,
      this.lastName,
      this.nickname,
      this.cpf,
      this.birthdate,
      this.phoneNumber,
      this.email,
      this.password});

  ClientModelDto.fromJson(Map<String, dynamic> json) {
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
