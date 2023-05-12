import 'package:flutter/material.dart';
import 'package:my_contacts/ui/widgets/widgets.dart';
import 'package:my_contacts/utils/utils.dart';
import 'package:my_contacts/extensions/extensions.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  AppText.heading5(
                    "Hi, ",
                    color: AppColors.primaryColor,
                  ),
                  AppText.caption("How are you doing today?")
                ],
              ),
              const Spacer(),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryColor.withOpacity(.5),
                ),
                child: const Icon(Icons.notifications_outlined),
              )
            ],
          ),
          SizedBox(
            height: context.deviceHeightPercentage(percentage: 10),
          ),
          Row(
            children: [
              AppText.heading4("My Contacts"),
              const Spacer(),
              Container(
                height: 25,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            ],
          ),
          SizedBox(
            height: context.deviceHeightPercentage(percentage: 10),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Column(
              children: [],
            ),
          )
        ],
      ),
    );
  }
}
