import 'package:flutter/material.dart';
import 'package:food_service/common/color_extension.dart';
import 'package:food_service/common_widget/tab_button.dart';
import 'package:food_service/tablefinder/homescreen.dart';

import '../common_widget/tab_button.dart';
import '../home/homepage.dart';
import '../menu/menu_view.dart';
import '../more/more_view.dart';
import '../offer/offer_view.dart';
import '../profile/profile_view.dart';

class MainTabView extends StatefulWidget {
  final String selectedRestaurant;
  final String selectedCity;

  const MainTabView({
    Key? key,
    required this.selectedRestaurant,
    required this.selectedCity,
  }) : super(key: key);
  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selctTab = 2;
  late PageStorageBucket storageBucket;
  late Widget selectPageView;

  @override
  void initState() {
    super.initState();
    selectPageView = HomeView(selectedRestaurant: widget.selectedRestaurant, selectedCity: widget.selectedCity);
    storageBucket = PageStorageBucket();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: storageBucket, child: selectPageView),
      backgroundColor: const Color(0xfff5f5f5),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            if (selctTab != 2) {
              selctTab = 2;
              selectPageView = HomeView(selectedRestaurant: widget.selectedRestaurant, selectedCity: widget.selectedCity);
            }
            if (mounted) {
              setState(() {});
            }
          },
          shape: const CircleBorder(),
          backgroundColor: selctTab == 2 ? TColor.primary : TColor.placeholder,
          child: Image.asset(
            "assets/images/tab_home.png",
            width: 30,
            height: 30,
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        surfaceTintColor: TColor.white,
        shadowColor: Colors.black,
        elevation: 1,
        notchMargin: 12,
        height: 64,
        shape: const CircularNotchedRectangle(),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TabButton(
                  title: "Menu",
                  icon: "assets/images/tab_menu.png",
                  onTap: () {
                    if (selctTab != 0) {
                      selctTab = 0;
                      selectPageView = const MenuView();
                    }
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isSelected: selctTab == 0),
              TabButton(
                  title: "Offer",
                  icon: "assets/images/tab_offer.png",
                  onTap: () {
                    if (selctTab != 1) {
                      selctTab = 1;
                      selectPageView = const OfferView();
                    }
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isSelected: selctTab == 1),
        
        
                const  SizedBox(width: 40, height: 40, ),
              TabButton(
                  title: "Dine-In",
                  icon: "assets/images/dinein.png",
                  onTap: () {
                    if (selctTab != 3) {
                      selctTab = 3;
                      selectPageView = const HomeScreen();
                    }
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isSelected: selctTab == 3),
              TabButton(
                  title: "More",
                  icon: "assets/images/tab_more.png",
                  onTap: () {
                    if (selctTab != 4) {
                      selctTab = 4;
                      selectPageView = const  MoreView();
                    }
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isSelected: selctTab == 4),
            ],
          ),
        ),
      ),
    );
  }
}
