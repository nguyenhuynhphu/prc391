class User {
  int id;
  String email;
  String name;
  int roleId;
  String deviceToken;

  User({this.id, this.email, this.name, this.roleId, this.deviceToken});

  User.id({
    this.email,
    this.name,
    this.roleId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        email: json['email'],
        name: json['name'],
        roleId: json['roleId'],
        deviceToken: json['deviceToken']);
  }

  Map toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'roleId': roleId,
        'deviceToken': deviceToken
      };
}
