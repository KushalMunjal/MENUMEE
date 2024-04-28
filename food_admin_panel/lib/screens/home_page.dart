import 'package:flutter/material.dart';
import 'package:food_admin_panel/screens/dashboard.dart';

import '../utils/app_colors.dart';
import 'widgets/side_bar_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.bgSideMenu,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///side navigation menu
            Expanded
            (child: SideBar() ,
            ),
            ///Main Body Part
            Expanded
            (
              flex:4,
              child: Dashboard() ,
            )

          ],)
      )
    );
  }
}