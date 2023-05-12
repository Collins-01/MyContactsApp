abstract class AuthInterface {
  Future<void> login(String email, String password);
  Future<void> signUp(String email, String password);
}

abstract class AuthService extends AuthInterface {}

abstract class AuthRepository extends AuthInterface {}
