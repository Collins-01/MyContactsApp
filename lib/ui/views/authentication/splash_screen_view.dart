import 'package:flutter/material.dart';
import 'package:my_contacts/navigations/navigation_service.dart';
import 'package:my_contacts/navigations/navigations.dart';
import 'package:my_contacts/ui/widgets/widgets.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    _onModelReady();
    super.initState();
  }

  _onModelReady() async {
    Future.delayed(const Duration(seconds: 1));
    NavigationService.instance.navigateToReplace(NavigationRoutes.LOGIN);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AppText.heading1("MY CONTACTS APP"),
      ),
    );
  }
}
