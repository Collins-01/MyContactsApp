import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_contacts/navigations/navigations.dart';
import 'package:my_contacts/ui/widgets/widgets.dart';
import 'package:my_contacts/utils/utils.dart';
import 'package:my_contacts/extensions/extensions.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final NavigationService _navigationService = NavigationService.instance;
  @override
  Widget build(BuildContext context) {
    return LoaderPage(
        busy: false,
        child: Scaffold(
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70),
                  child: Center(
                    child: AppText.heading4(
                      "MyContactsApp",
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.deviceHeightPercentage(percentage: 10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.heading2(
                      "Sign Up",
                      color: AppColors.primaryColor,
                    ),
                    const SizedBox(height: 5),
                    AppText.small("Create your mycontactapp account")
                  ],
                ),
                SizedBox(
                  height: context.deviceHeightPercentage(percentage: 5),
                ),
                AppTextField(
                  controller: emailController,
                  title: "Email",
                  hintText: "example@example.com",
                  validator: FieldValidators.email,
                ),
                AppTextField(
                  controller: passwordController,
                  hintText: "********",
                  title: "Password",
                  isPassword: true,
                  validator: FieldValidators.password,
                ),
                AppTextField(
                  controller: confirmPasswordController,
                  hintText: "********",
                  title: "Confirm Password",
                  isPassword: true,
                  validator: FieldValidators.password,
                ),
                SizedBox(
                  height: context.deviceHeightPercentage(percentage: 2),
                ),
                AppLongButton(
                  title: "Create Account",
                  onTap: () {
                    _navigationService
                        .navigateToReplace(NavigationRoutes.EMAIL_VERIFICATION);
                  },
                ),
                SizedBox(
                  height: context.deviceHeightPercentage(percentage: 4),
                ),
                Center(
                  child: Text.rich(
                    TextSpan(
                      text: "Already have an account? ",
                      style: bodySmall,
                      children: <TextSpan>[
                        TextSpan(
                          text: "Sign In",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await _navigationService
                                  .navigateTo(NavigationRoutes.LOGIN);
                            },
                          style: bodySmall.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
