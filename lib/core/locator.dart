import 'package:get_it/get_it.dart';
import 'package:my_contacts/core/data/remote/auth/auth.dart';

GetIt locator = GetIt.instance;

setUpLocator() {
  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}
