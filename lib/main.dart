import 'package:flutter/material.dart';
import 'package:my_contacts/ui/views/views.dart';
import 'navigations/navigations.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Contacts App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: RouteGenerators.generateRoutes,
    );
  }
}
