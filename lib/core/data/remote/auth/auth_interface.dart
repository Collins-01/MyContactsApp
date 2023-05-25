import 'package:my_contacts/core/data/remote/auth/login_response_payload.dart';
import 'package:my_contacts/core/models/user_model.dart';

abstract class AuthInterface {
  Future<LoginResponsePayload> login(String email, String password);
  Future<void> signUp(String email, String password);

  UserModel? get currentUser;
}

abstract class AuthService extends AuthInterface {}

abstract class AuthRepository extends AuthInterface {}
