import 'package:flutter/material.dart';
import 'package:food_service/home/homepage.dart';
import 'package:food_service/menu/menu_view.dart';
import 'package:food_service/more/more_view.dart';
import 'package:food_service/more/my_order_view.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({Key? key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int _selectedIndex = 0; // Initial index set to Home (0)
  late PageStorageBucket storageBucket;
  // late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    storageBucket = PageStorageBucket();
  }

  void onTabTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  List<Widget> buildPages() {
    return [
      HomeView(),
      MenuView(),
      MyOrderView(),
      MoreView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
     List<Widget> pages = buildPages();
    return Scaffold(
        body: PageStorage(
        bucket: storageBucket,
        child: pages[_selectedIndex],
      ),
      backgroundColor: const Color(0xfff5f5f5),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              gap: 8,
              activeColor: Colors.white,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              duration: Duration(milliseconds: 600),
              tabBackgroundColor: Colors.blue,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  onPressed: () => onTabTapped(0),
                ),
                GButton(
                  icon: Icons.restaurant_menu,
                  text: 'Menu',
                  onPressed: () => onTabTapped(1),
                ),
                GButton(
                  icon: Icons.menu,
                  text: 'Orders',
                  onPressed: () => onTabTapped(2),
                ),
                GButton(
                  icon: Icons.more_vert,
                  text: 'More',
                  onPressed: () => onTabTapped(3),
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: onTabTapped,
            ),
          ),
        ),
      ),
    );
  }
}




