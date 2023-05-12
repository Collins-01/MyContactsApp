import 'package:my_contacts/core/data/remote/auth/auth.dart';
import 'package:my_contacts/core/locator.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl({AuthService? authService})
      : _authService = authService ?? locator();
  @override
  Future<void> login(String email, String password) async {
    return await _authService.login(email, password);
  }

  @override
  Future<void> signUp(String email, String password) async {
    return await _authService.signUp(email, password);
  }
}
