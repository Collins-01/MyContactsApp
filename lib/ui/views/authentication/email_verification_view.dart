import 'package:flutter/material.dart';
import 'package:my_contacts/ui/widgets/widgets.dart';
import 'package:my_contacts/utils/utils.dart';
import '../../../navigations/navigations.dart';

class EmailVerificationView extends StatelessWidget {
  EmailVerificationView({super.key});

  final NavigationService _navigationService = NavigationService.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppText.heading4(
                "Verification email sent!",
                color: AppColors.primaryColor,
              ),
              const SizedBox(
                height: 16,
              ),
              AppText.body("Please check your email to verify your"),
              AppText.body("mycontactapp account"),
              const SizedBox(
                height: 16,
              ),
              AppShortButton(
                title: "Done",
                onTap: () async {
                  await _navigationService
                      .navigateToReplace(NavigationRoutes.HOME);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
