import 'package:flutter/material.dart';
import 'package:food_admin_panel/screens/dashboard.dart';

import '../utils/app_colors.dart';
import 'widgets/notification_card_widget.dart';
import 'widgets/side_bar_menu.dart';

class QrMenuPage extends StatefulWidget {
  const QrMenuPage({Key? key});

  @override
  State<QrMenuPage> createState() => _HomePageState();
}

class _HomePageState extends State<QrMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///side navigation menu
            Expanded(
              child: SideBar(),
            ),
            ///Main Body Part
            Expanded(
              flex: 4,
              child: Container(
                child: Column(
                  children: [
                    NotificationCardWidget(),
                    SizedBox(
                      height: 10, // Add some space between the widgets
                    ),
                    Container(
                      
                      width: 200, // Adjust width according to your preference
                      height: 200, // Adjust height according to your preference
                      child: Image.asset(
                       
                        "assets/qr.png",
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.cover, // Adjust the fit as needed
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
