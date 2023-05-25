// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String email;
  String id;
  UserModel({
    required this.email,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return {};
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      id: json['id'],
    );
  }
}
