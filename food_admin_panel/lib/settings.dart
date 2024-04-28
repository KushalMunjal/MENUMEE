import 'package:flutter/material.dart';
import 'package:food_admin_panel/screens/widgets/side_bar_menu.dart';
import '../utils/app_colors.dart';


class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Side navigation menu
            Expanded(
              child: SideBar(),
            ),
            /// Main Body Part
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(20), // Add padding for better spacing
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20), // Add some space between elements
                    ListTile(
                      title: Text('Profile'),
                      onTap: () {
                        // Navigate to profile settings page
                        // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileSettingsPage()));
                      },
                    ),
                    Divider(), // Add a divider for visual separation
                    ListTile(
                      title: Text('Notifications'),
                      onTap: () {
                        // Navigate to notification settings page
                        // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationSettingsPage()));
                      },
                    ),
                    Divider(), // Add a divider for visual separation
                    ListTile(
                      title: Text('Privacy'),
                      onTap: () {
                        // Navigate to privacy settings page
                        // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacySettingsPage()));
                      },
                    ),
                    Divider(), // Add a divider for visual separation
                    // Add more settings options as needed
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
