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

  @override
  String toString() {
    return 'ListProfiles{role: $role}';
  }
}
