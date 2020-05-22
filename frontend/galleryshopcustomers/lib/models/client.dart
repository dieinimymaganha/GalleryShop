class ClientModel {
  final int id;
  final String name;
  final String lastName;
  final String nickname;
  final String cpf;
  final String birthdate;
  final String phoneNumber;
  final String email;

  ClientModel(
    this.id,
    this.name,
    this.lastName,
    this.nickname,
    this.cpf,
    this.birthdate,
    this.phoneNumber,
    this.email,
  );

  ClientModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        lastName = json['lastName'],
        nickname = json['nickname'],
        cpf = json['cpf'],
        birthdate = json['birthdate'],
        phoneNumber = json['phoneNumber'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'lastName': lastName,
        'nickname': nickname,
        'cpf': cpf,
        'birthdate': birthdate,
        'phoneNumber': phoneNumber,
        'email': email,
      };

  @override
  String toString() {
    return 'Client{id: $id, name: $name, lastName: $lastName,'
        ' nickname: $nickname, cpf: $cpf, birthDate: $birthdate,'
        ' phoneNumber: $phoneNumber, email: $email}';
  }
}
