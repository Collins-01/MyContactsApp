import 'package:flutter/material.dart';
import 'package:my_contacts/ui/views/home/add_contact_view.dart';
import 'package:my_contacts/ui/views/home/components/contact_card.dart';
import 'package:my_contacts/ui/widgets/widgets.dart';
import 'package:my_contacts/utils/utils.dart';
import 'package:my_contacts/extensions/extensions.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                    child: Icon(
                      Icons.notifications_outlined,
                      color: AppColors.primaryColor,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.deviceHeightPercentage(percentage: 3),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
              child: Row(
                children: [
                  AppText.heading4("My Contacts"),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Scaffold.of(context).showBottomSheet(
                        (context) => Container(
                          height: context.getDeviceHeight,
                          width: context.getDeviceWidth,
                          decoration: const BoxDecoration(
                            color: Colors.green,
                          ),
                        ),
                      );
                    },
                    child: Container(
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
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: context.deviceHeightPercentage(percentage: 2),
            ),
            // * It will take in the model.
            Expanded(
                child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: SizingConfig.defaultPadding),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ...List.generate(
                      10,
                      (index) => const ContactCard(),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
