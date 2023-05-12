import 'package:flutter/material.dart';
import 'package:my_contacts/ui/widgets/widgets.dart';
import 'package:my_contacts/utils/utils.dart';

class AddContactView extends StatelessWidget {
  AddContactView({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: AppText.heading4("Add Contact")),
            const SizedBox(
              height: 20,
            ),
            AppTextField(
              controller: nameController,
              title: "Name",
              hintText: "Contact name",
            ),
            AppTextField(
              controller: phoneController,
              title: "Phone",
              hintText: "+234",
              keyboardType: TextInputType.number,
            ),
            AppTextField(
              controller: emailController,
              title: "Email",
              hintText: "example@example.com",
            ),
            AppTextField(
              controller: addressController,
              title: "Home Address",
              hintText: "Enter address of contact.",
            ),
            const SizedBox(
              height: 20,
            ),
            AppLongButton(
              title: "Add Contact",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
