class TokenModel {
  String token;
  String type;

  TokenModel(this.token, this.type);

  TokenModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['type'] = this.type;
    return data;
  }

  @override
  String toString() {
    return 'TokenModel{token: $token, type: $type}';
  }
}
