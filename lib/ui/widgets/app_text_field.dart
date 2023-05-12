import 'package:flutter/material.dart';
import 'package:my_contacts/ui/widgets/app_text.dart';
import '../../utils/utils.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final bool isPassword;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  const AppTextField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    this.isPassword = false,
    this.validator,
    this.keyboardType,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText.bodyLarge(
            widget.title,
            color: AppColors.primaryColor,
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
              border: Border.all(
                color: AppColors.textColor,
                width: 0.3,
              ),
            ),
            child: TextFormField(
              keyboardType: widget.keyboardType,
              validator: widget.validator,
              obscureText:
                  widget.isPassword ? (isVisible ? true : false) : false,
              controller: widget.controller,
              decoration: InputDecoration(
                filled: true,
                contentPadding: const EdgeInsets.only(top: 17, left: 10),
                border: InputBorder.none,
                hintText: widget.hintText,
                suffixIcon: !widget.isPassword
                    ? const SizedBox.shrink()
                    : IconButton(
                        onPressed: () => toggleVisibility(),
                        icon: Icon(isVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                      ),
              ),
            ),
          )
        ],
      ),
    );
  }

  toggleVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }
}
