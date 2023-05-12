import 'package:flutter/material.dart';
import 'package:my_contacts/ui/views/home/add_contact_view.dart';
import 'package:my_contacts/ui/views/home/components/contact_card.dart';
import 'package:my_contacts/ui/widgets/widgets.dart';
import 'package:my_contacts/utils/utils.dart';
import 'package:my_contacts/extensions/extensions.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isOpened = false;
  final roundedRadius = 16.0;

  setIsOpened(bool e) {
    setState(() {
      _isOpened = e;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: GestureDetector(
        onTap: () {
          if (_isOpened) {
            Navigator.pop(context);
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
              color: _isOpened ? Colors.black.withOpacity(.5) : null),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: SizingConfig.defaultPadding),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText.heading3(
                            "Hi, ",
                            color: AppColors.primaryColor,
                          ),
                          AppText.body("How are you doing today?")
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffE7E7ff),
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
                  padding: EdgeInsets.symmetric(
                      horizontal: SizingConfig.defaultPadding),
                  child: Row(
                    children: [
                      AppText.heading4("My Contacts"),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          _scaffoldKey.currentState!
                              .showBottomSheet(
                                (context) => Container(
                                  height: context.deviceHeightPercentage(
                                      percentage: 85),
                                  width: context.getDeviceWidth,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(roundedRadius),
                                      topRight: Radius.circular(roundedRadius),
                                    ),
                                  ),
                                  child: AddContactView(),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(roundedRadius),
                                    topRight: Radius.circular(roundedRadius),
                                  ),
                                ),
                              )
                              .closed
                              .then((value) => setIsOpened(false));
                          setIsOpened(true);
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
                  padding: EdgeInsets.symmetric(
                      horizontal: SizingConfig.defaultPadding),
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
        ),
      ),
    );
  }
}
