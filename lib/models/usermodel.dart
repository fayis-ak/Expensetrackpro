class UserModel {
  String? uid;
  String name;
  String email;
  String password;
  String type;

  UserModel({
    required this.name,
    required this.password,
    required this.type,
    required this.email,
    this.uid,
  });

  Map<String, dynamic> toJson(uid) => {
        'name': name,
        'email': email,
        'password': password,
        'usertype': type,
        'uid': uid
      };

  factory UserModel.fromJsone(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      password: json['password'],
      type: json['usertype'],
      email: json['email'],
      uid: json['uid']
    );
  }
}
