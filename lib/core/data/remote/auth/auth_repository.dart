import 'package:my_contacts/core/data/local/local.dart';
import 'package:my_contacts/core/data/remote/auth/auth.dart';
import 'package:my_contacts/core/data/remote/auth/login_response_payload.dart';
import 'package:my_contacts/core/locator.dart';
import 'package:my_contacts/core/models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;
  final LocalCache _localCache;

  AuthRepositoryImpl({AuthService? authService, LocalCache? localCache})
      : _authService = authService ?? locator(),
        _localCache = localCache ?? locator();
  @override
  Future<LoginResponsePayload> login(String email, String password) async {
    var response = await _authService.login(email, password);
    String token = response.token;
    await _localCache.saveToken(token);
    return response;
  }

  @override
  Future<void> signUp(String email, String password) async {
    return await _authService.signUp(email, password);
  }

  @override
  UserModel? get currentUser => _authService.currentUser;
}
