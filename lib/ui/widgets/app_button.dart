import 'package:flutter/material.dart';
import 'package:my_contacts/extensions/extensions.dart';
import 'package:my_contacts/ui/widgets/widgets.dart';
import 'package:my_contacts/utils/utils.dart';

class AppLongButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const AppLongButton({Key? key, required this.title, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        width: context.getDeviceWidth,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        alignment: Alignment.center,
        child: AppText.bodyLarge(
          title,
          color: Colors.white,
        ),
      ),
    );
  }
}

class AppShortButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const AppShortButton({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 55,
        width: 180,
        decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        alignment: Alignment.center,
        child: AppText.bodyLarge(
          title,
          color: Colors.white,
        ),
      ),
    );
  }
}
