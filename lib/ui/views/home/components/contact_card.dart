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
          borderRadius: const BorderRadius.all(Radius.circular(6)),
          border: Border.all(width: 0.1),
        ),
        child: Column(
          children: [
            // * Names and Icon
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                color: const Color(0xfffef4f4),
                border: Border.all(width: 0.1),
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.phone),
                        const SizedBox(
                          width: 6,
                        ),
                        AppText.body("+2348163509379")
                      ],
                    ),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        const Icon(Icons.email_outlined),
                        const SizedBox(
                          width: 6,
                        ),
                        AppText.body(
                          "johndoe@gmail.com",
                          maxLines: 1,
                        )
                      ],
                    ),
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
                  Expanded(
                    child: AppText.body(
                      "Pariatur aliqua amet ipsum nostrud qui .",
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
