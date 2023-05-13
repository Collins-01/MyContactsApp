import 'package:get_it/get_it.dart';
import 'package:my_contacts/core/data/remote/auth/auth.dart';
import 'package:my_contacts/core/data/remote/contacts/contacts.dart';
import 'package:my_contacts/ui/views/authentication/viewmodels/viewmodels.dart';
import 'package:my_contacts/ui/views/home/viewmodels/viewmodels.dart';

GetIt locator = GetIt.instance;

setUpLocator() {
  // * Auth Module
  locator.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
  // * Contacts Module
  locator.registerLazySingleton<ContactService>(() => ContactServiceImpl());
  locator
      .registerLazySingleton<ContactRepository>(() => ContactRepositoryImpl());

//* ViewModels

// * Auth
  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => SignUpViewModel());
  // *Home
  locator.registerFactory(() => AddContactViewModel());
}
