class UserModel {
  String? name;

  String? email;

  String? password;

  String? uId;

  UserModel({
    this.name,
    required this.email,
    this.password,
    this.uId,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    password = json['password'];
    uId = json['uId'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'uId': uId,
    };
  }
}
