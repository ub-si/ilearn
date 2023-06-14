import 'dart:convert';

class UserModel {
  int? id;
  String? name;
  String? email;
  String? password;
  bool? isAdmin;
  DateTime? createdAt;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.isAdmin,
    this.createdAt,
    this.token,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'is_admin': isAdmin,
      'created_at': createdAt?.millisecondsSinceEpoch,
      'token': token,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      isAdmin: map['is_admin'],
      createdAt: map["created_at"] != null ? DateTime.parse(map["created_at"]) : null,
      token: map['token'],
    );
  }

  static List<UserModel> fromList(list) {
    return List<UserModel>.from(list.map((x) => UserModel.fromMap(x)));
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, password: $password, isAdmin: $isAdmin, createdAt: $createdAt, token: $token)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password &&
        other.isAdmin == isAdmin &&
        other.createdAt == createdAt &&
        other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ password.hashCode ^ isAdmin.hashCode ^ createdAt.hashCode ^ token.hashCode;
  }
}
