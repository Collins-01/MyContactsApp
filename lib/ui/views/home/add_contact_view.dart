import 'package:flutter/material.dart';
import 'package:my_contacts/ui/views/home/viewmodels/viewmodels.dart';
import 'package:my_contacts/ui/views/view_states/base_view.dart';
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
    return BaseView<AddContactViewModel>(
        builder: (context, model, child) => Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
              child: SingleChildScrollView(
                child: Form(
                  key: model.formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: AppText.heading4("Add Contact"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppTextField(
                        controller: nameController,
                        title: "Name",
                        hintText: "Contact name",
                        validator: (v) =>
                            FieldValidators.string(v, "Contact name"),
                      ),
                      AppTextField(
                        controller: phoneController,
                        title: "Phone",
                        hintText: "+234",
                        keyboardType: TextInputType.number,
                        validator: (v) =>
                            FieldValidators.string(v, 'Phone number'),
                      ),
                      AppTextField(
                        controller: emailController,
                        title: "Email",
                        hintText: "example@example.com",
                        validator: FieldValidators.email,
                      ),
                      AppTextField(
                        controller: addressController,
                        title: "Home Address",
                        hintText: "Enter address of contact.",
                        validator: (v) => FieldValidators.string(v, "address"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      AppLongButton(
                        title: "Add Contact",
                        onTap: () => model.createContact(
                            nameController.text,
                            phoneController.text,
                            emailController.text,
                            addressController.text),
                      )
                    ],
                  ),
                ),
              ),
            ));
  }
}
