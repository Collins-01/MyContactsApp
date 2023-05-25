// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_contacts/core/models/user_model.dart';

class LoginResponsePayload {
  String token;
  UserModel user;
  LoginResponsePayload({required this.token, required this.user});
}
