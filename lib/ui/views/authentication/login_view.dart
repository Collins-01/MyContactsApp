import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_contacts/navigations/navigations.dart';
import 'package:my_contacts/ui/views/authentication/viewmodels/login_viewmodel.dart';
import 'package:my_contacts/ui/views/view_states/base_view.dart';
import 'package:my_contacts/ui/widgets/widgets.dart';
import 'package:my_contacts/utils/utils.dart';
import 'package:my_contacts/extensions/extensions.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final NavigationService _navigationService = NavigationService.instance;

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(onModelDisposed: (model) {
      emailController.dispose();
      passwordController.dispose();
    }, builder: (
      context,
      model,
      child,
    ) {
      return LoaderPage(
        busy: model.isBusy,
        child: Scaffold(
          body: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Form(
                  key: model.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: context.deviceHeightPercentage(percentage: 8),
                      ),
                      Center(
                          child: AppText.heading2(
                        "MyContactsApp",
                        color: AppColors.primaryColor,
                      )),
                      SizedBox(
                        height: context.deviceHeightPercentage(percentage: 10),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText.heading2(
                              "Sign In",
                              color: AppColors.primaryColor,
                            ),
                            const SizedBox(height: 5),
                            AppText.small("Log Into your mycontactapp account")
                          ]),
                      SizedBox(
                        height: context.deviceHeightPercentage(percentage: 6.5),
                      ),
                      AppTextField(
                        validator: FieldValidators.email,
                        controller: emailController,
                        title: "Email",
                        hintText: "example@gmail.com",
                        keyboardType: TextInputType.emailAddress,
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(" ")
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: AppText.body(
                          "Forgot password?",
                          color: AppColors.primaryColor,
                        ),
                      ),
                      AppTextField(
                        isPassword: true,
                        validator: FieldValidators.password,
                        controller: passwordController,
                        title: "Password",
                        hintText: "*********",
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(" ")
                        ],
                      ),
                      const SizedBox(height: 30),
                      AppLongButton(
                        onTap: () => model.login(
                            emailController.text, passwordController.text),
                        title: "Login",
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Text.rich(
                          TextSpan(
                            text: "Don't have an account? ",
                            style: bodySmall,
                            children: <TextSpan>[
                              TextSpan(
                                text: "Sign Up",
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () async {
                                    await _navigationService
                                        .navigateTo(NavigationRoutes.SIGNUP);
                                  },
                                style: bodySmall.copyWith(
                                    color: AppColors.primaryColor,
                                    fontWeight: FontWeight.w700),
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
        ),
      );
    });
  }
}
