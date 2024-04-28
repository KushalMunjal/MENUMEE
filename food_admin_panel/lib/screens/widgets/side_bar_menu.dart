import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_admin_panel/fetch_data.dart';
import 'package:food_admin_panel/screens/widgets/add_product.dart';
import 'package:food_admin_panel/settings.dart';
import 'package:food_admin_panel/utils/app_colors.dart';

import '../qr_menu_page.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: AppColor.bgSideMenu,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "Eat Me",
                style: TextStyle(
                  color: AppColor.yellow,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DrawerListTile(
              title: "Dashboard",
              icon: "assets/menu_home.png",
              press: () {},
            ),
             DrawerListTile(
              title: "Recruitment",
              icon: "assets/menu_onboarding.png",
              press: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>QrMenu()),
                );
              },
            ),
            DrawerListTile(
              title: "OnBoarding",
              icon: "assets/menu_onboarding.png",
              press: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QrMenuPage()),
                );
              },
            ),
            DrawerListTile(
              title: "Product",
              icon: "assets/menu_report.png",
               press: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddProductPage()),
                );
              },
            ),
            DrawerListTile(
              title: "Calendar",
              icon: "assets/menu_calendar.png",
              press: () {},
            ),
           DrawerListTile(
              title: "Settings",
              icon: "assets/menu_onboarding.png",
              press: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            Spacer(),
            Image.asset("assets/sidebar_image.png")
          ],
        ),
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final String title, icon;
  final VoidCallback press;

  const DrawerListTile({Key? key, required this.title, required this.icon, required this.press})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Image.asset(
        icon,
        color: AppColor.white,
        height: 16,
      ),
      title: Text(
        title,
        style: TextStyle(color: AppColor.white),
      ),
    );
  }
}