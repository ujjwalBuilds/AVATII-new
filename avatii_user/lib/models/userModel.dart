class UserModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String token;

  UserModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'token': token,
    };
  }
}
