import 'package:get_it/get_it.dart';
import 'package:my_contacts/core/data/remote/auth/auth.dart';
import 'package:my_contacts/ui/views/authentication/viewmodels/login_viewmodel.dart';
import 'package:my_contacts/ui/views/authentication/viewmodels/signup_viewmodel.dart';

GetIt locator = GetIt.instance;

setUpLocator() {
  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());

//  Factory

  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => SignUpViewModel());
}
