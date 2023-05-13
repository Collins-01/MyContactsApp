import 'package:flutter/material.dart';
import 'package:my_contacts/utils/utils.dart';

import '../../../widgets/widgets.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Column(
          children: [
            // * Names and Icon
            Container(
              decoration: BoxDecoration(
                color: const Color(0xfffef4f4),
                border: Border.all(width: 0.9),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.bodyLarge("John Doe"),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.more_vert,
                        color: AppColors.primaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.phone),
                      const SizedBox(
                        width: 6,
                      ),
                      AppText.body("+2348163509379")
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.email_outlined),
                      const SizedBox(
                        width: 6,
                      ),
                      AppText.body("johndoe@gmail.com")
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 10),
              child: Row(
                children: [
                  const Icon(Icons.location_on_outlined),
                  const SizedBox(
                    width: 6,
                  ),
                  AppText.body("Pariatur aliqua amet ipsum nostrud qui.")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}