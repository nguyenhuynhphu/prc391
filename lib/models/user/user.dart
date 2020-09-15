class User {
  int id;
  String email;
  String name;
  int roleId;

  User({
    this.id,
    this.email,
    this.name,
    this.roleId,
  });

  User.id({
    this.email,
    this.name,
    this.roleId,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['firstName'],
      roleId: json['roleId'],
    );
  }

  Map toJson() => {
        'id': id,
        'email': email,
        'name': name,
        'roleId': roleId,
      };
}
