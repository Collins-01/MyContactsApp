import 'package:flutter/material.dart';
import 'package:my_contacts/ui/widgets/widgets.dart';
import 'package:my_contacts/utils/utils.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  LoginView({super.key});

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
              const SizedBox(height: 120),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                AppText.heading2(
                  "Sign In",
                  // color: AppColors.primaryColor,
                ),
                const SizedBox(height: 5),
                AppText.small("Log Into your mycontactapp account")
              ]),
              const SizedBox(height: 50),
              AppTextField(
                validator: FieldValidators.email,
                controller: emailController,
                title: "Email",
                hintText: "example@gmail.com",
              ),
              AppTextField(
                isPassword: true,
                validator: FieldValidators.email,
                controller: emailController,
                title: "Password",
                hintText: "*********",
              ),
              const SizedBox(height: 50),
              AppLongButton(
                onTap: () {},
                title: "Login",
              ),
              const SizedBox(height: 50),
              Center(
                child: Text.rich(
                  TextSpan(
                    text: "Already have an account? ",
                    style: bodySmall,
                    children: <TextSpan>[
                      TextSpan(
                        text: "Sign Up",
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
    );
  }
}
