import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_contacts/navigations/navigations.dart';
import 'package:my_contacts/ui/views/authentication/viewmodels/signup_viewmodel.dart';
import 'package:my_contacts/ui/views/view_states/base_view.dart';
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
    return BaseView<SignUpViewModel>(
      onModelDisposed: (m) {
        emailController.dispose();
        passwordController.dispose();
        confirmPasswordController.dispose();
      },
      builder: (context, model, child) => LoaderPage(
        busy: model.isBusy,
        child: Scaffold(
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
            child: Form(
              key: model.formKey,
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
                    keyboardType: TextInputType.emailAddress,
                    inputFormatters: [FilteringTextInputFormatter.deny(" ")],
                  ),
                  AppTextField(
                    controller: passwordController,
                    hintText: "********",
                    title: "Password",
                    isPassword: true,
                    validator: FieldValidators.password,
                    inputFormatters: [FilteringTextInputFormatter.deny(" ")],
                  ),
                  AppTextField(
                    controller: confirmPasswordController,
                    hintText: "********",
                    title: "Confirm Password",
                    isPassword: true,
                    validator: FieldValidators.password,
                    inputFormatters: [FilteringTextInputFormatter.deny(" ")],
                  ),
                  SizedBox(
                    height: context.deviceHeightPercentage(percentage: 2),
                  ),
                  AppLongButton(
                    title: "Create Account",
                    onTap: () => model.signUp(
                        emailController.text, passwordController.text),
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
          ),
        ),
      ),
    );
  }
}
