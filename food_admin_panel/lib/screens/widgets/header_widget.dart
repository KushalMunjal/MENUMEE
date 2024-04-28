import 'package:flutter/material.dart';

import 'package:food_admin_panel/utils/app_colors.dart';

import '../query_page.dart';



class HeaderWidget extends StatefulWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Text(
            "Dashboard",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              navigationIcon(
                icon: Icons.search,
                onPressed: () {
                  // Handle search button click
                },
              ),
              navigationIcon(
                icon: Icons.send,
                onPressed: () {
                  // Navigate to the desired screen when send button is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QueryPage()),
                  );
                },
              ),
              navigationIcon(
                icon: Icons.notifications_none_rounded,
                onPressed: () {
                  // Handle notification button click
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget navigationIcon({required IconData icon, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IconButton(
        icon: Icon(icon),
        color: AppColor.black,
        onPressed: onPressed,
      ),
    );
  }
}

class YourScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Screen'),
      ),
      body: Center(
        child: Text('This is your desired screen'),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: HeaderWidget(),
    ),
  ));
}
