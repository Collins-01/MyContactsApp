import 'package:get_it/get_it.dart';
import 'package:my_contacts/core/data/local/local_cache_impl.dart';
import 'package:my_contacts/core/data/remote/auth/auth.dart';
import 'package:my_contacts/core/data/remote/contacts/contacts.dart';
import 'package:my_contacts/core/network_service/client.dart';
import 'package:my_contacts/ui/views/authentication/viewmodels/viewmodels.dart';
import 'package:my_contacts/ui/views/home/viewmodels/viewmodels.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/local/local_cache.dart';

GetIt locator = GetIt.instance;

setUpLocator() async {
  // * Cache

  final sharedPrefs = await SharedPreferences.getInstance();
  locator.registerSingleton(sharedPrefs);
  locator.registerLazySingleton<LocalCache>(
      () => LocalCacheImpl(sharedPreferences: sharedPrefs));

// * Network Client
  // final qlClient = await GraphqlClientProvider().createGraphQLClient();
  // locator.registerSingleton(qlClient);
  locator.registerLazySingleton(() => NetworkClient());

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
  locator.registerFactory(() => HomeViewModel());
}
