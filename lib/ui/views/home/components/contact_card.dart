import 'package:flutter/material.dart';
import 'package:my_contacts/core/data/remote/contacts/contacts.dart';
import 'package:my_contacts/core/locator.dart';
import 'package:my_contacts/core/models/contact_model.dart';
import 'package:my_contacts/navigations/navigation_service.dart';
import 'package:my_contacts/utils/utils.dart';

import '../../../widgets/widgets.dart';

class ContactCard extends StatelessWidget {
  final ContactModel contact;
  const ContactCard({super.key, required this.contact});

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
                    AppText.bodyLarge(contact.name),
                    PopupMenuButton(
                      onSelected: (value) {
                        if (value == 'delete') {
                          showDialog(
                            context: context,
                            builder: (_) => AlertDialog(
                              title: AppText.heading6("Delete Contact"),
                              content: AppText.body(
                                  "Are you sure you want to delete ${contact.name}'s contact? "),
                              actions: [
                                TextButton(
                                  onPressed: () async {
                                    final ContactRepository contactRepository =
                                        locator();
                                    await contactRepository
                                        .deleteContact(contact.id);
                                    NavigationService.instance.goBack();
                                  },
                                  child: AppText.body(
                                    "Yes",
                                    color: Colors.red,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: AppText.body(
                                    "No",
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }
                      },
                      itemBuilder: (BuildContext bc) {
                        return [
                          PopupMenuItem(
                            value: 'delete',
                            child: AppText.body("Delete"),
                          ),
                          PopupMenuItem(
                            value: 'update',
                            child: AppText.body("Update"),
                          ),
                        ];
                      },
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
                  // * Phone Number Section
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 1),
                      child: Row(
                        children: [
                          const Icon(Icons.phone),
                          const SizedBox(
                            width: 6,
                          ),
                          AppText.body(
                            contact.phone,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          )
                        ],
                      ),
                    ),
                  ),
                  // const Spacer(),
                  // * Email Section
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1),
                      child: Row(
                        children: [
                          const Icon(Icons.email_outlined),
                          const SizedBox(
                            width: 6,
                          ),
                          AppText.body(
                            contact.email,
                            maxLines: 1,
                          )
                        ],
                      ),
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
                      contact.address,
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
