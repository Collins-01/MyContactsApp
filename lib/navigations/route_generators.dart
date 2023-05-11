import 'package:flutter/material.dart';
import 'package:my_contacts/navigations/navigation_routes.dart';
import 'package:my_contacts/ui/views/views.dart';

class RouteGenerators {
  static Route<dynamic> generateRoutes(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NavigationRoutes.LOGIN:
        return MaterialPageRoute(
          builder: (_) => LoginView(),
        );
      case NavigationRoutes.SIGNUP:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
        );

      case NavigationRoutes.EMAIL_VERIFICATION:
        return MaterialPageRoute(
          builder: (_) => const EmailVerificationView(),
        );

      case NavigationRoutes.HOME:
        return MaterialPageRoute(
          builder: (_) => const HomeView(),
        );
      case NavigationRoutes.SPLASH_SCREEN:
        return MaterialPageRoute(
          builder: (_) => const SplashScreenView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text("No route defined for ${routeSettings.name}"),
            ),
          ),
        );
    }
  }
}
