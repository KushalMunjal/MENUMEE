import 'dart:async';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:food_admin_panel/screens/widgets/notification_card_widget.dart';
import 'package:food_admin_panel/screens/widgets/side_bar_menu.dart';
import 'package:food_admin_panel/utils/app_colors.dart';

class QrMenu extends StatefulWidget {
  const QrMenu({Key? key});

  @override
  State<QrMenu> createState() => _HomePageState();
}

class _HomePageState extends State<QrMenu> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _dataLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SideBar(),
            ),
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NotificationCardWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      StreamBuilder<DocumentSnapshot>(
                        stream: _firestore
                            .collection('users')
                            .doc('Employee Details')
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          if (!snapshot.hasData ||
                              snapshot.data!.data() == null) {
                            print('No data found in Firestore');
                            return Text('No data found');
                          }

                          try {
                            var data =
                                snapshot.data!.data() as Map<String, dynamic>;
                            print('Firestore Data: $data');

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name: ${data['name'] ?? 'N/A'}'),
                                Text('Age: ${data['age'] ?? 'N/A'}'),
                                Text(
                                    'Eligibility: ${data['eligibility'] ?? 'N/A'}'),
                                SizedBox(height: 10),
                                Divider(),
                                ...List.generate(6, (index) {
                                  var userId = 'user${index + 1}';
                                  return StreamBuilder<DocumentSnapshot>(
                                    stream: _firestore
                                        .collection('users')
                                        .doc(userId)
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState ==
                                          ConnectionState.waiting) {
                                        return CircularProgressIndicator();
                                      }
                                      if (snapshot.hasError) {
                                        return Text(
                                            'Error: ${snapshot.error}');
                                      }
                                      if (!snapshot.hasData ||
                                          snapshot.data!.data() == null) {
                                        print(
                                            'No data found in Firestore for user $userId');
                                        return Text('No data found');
                                      }

                                      var userData =
                                          snapshot.data!.data() as Map<String, dynamic>;
                                      print(
                                          'Firestore Data for user $userId: $userData');
                                      var name = userData['name'] ?? 'N/A';
                                      var age = userData['age'] ?? 'N/A';
                                      var eligibility =
                                          userData['eligibility'] ?? 'N/A';
                                      var accepted = userData['accepted'] ?? false;
                                      var rejected = userData['rejected'] ?? false;

                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Name: $name'),
                                          Text('Age: $age'),
                                          Text('Eligibility: $eligibility'),
                                          SizedBox(height: 10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              if (!accepted && !rejected)
                                                Row(
                                                  children: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        _storeDataInFile(
                                                            name, age, eligibility);
                                                        _handleAcceptance(userId);
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.green,
                                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                                      ),
                                                      child: Text('Accept', style: TextStyle(color: Colors.white)),
                                                    ),
                                                    SizedBox(width: 10),
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) => AlertDialog(
                                                            title: Text('Confirmation'),
                                                            content: Text('Are you sure you want to reject?'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () {
                                                                  Navigator.of(context).pop();
                                                                },
                                                                child: Text('Cancel'),
                                                              ),
                                                              TextButton(
                                                                onPressed: () {
                                                                  _handleRejection(userId);
                                                                  Navigator.of(context).pop();
                                                                },
                                                                child: Text('Reject'),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.red,
                                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                                      ),
                                                      child: Text('Reject', style: TextStyle(color: Colors.white)),
                                                    ),
                                                  ],
                                                ),
                                              if (accepted)
                                                Icon(Icons.check_circle,
                                                    color: Colors.green),
                                              if (rejected)
                                                Icon(Icons.cancel, color: Colors.red),
                                            ],
                                          ),
                                          Divider(),
                                        ],
                                      );
                                    },
                                  );
                                }),
                              ],
                            );
                          } catch (e) {
                            print('Error accessing Firestore data: $e');
                            return Text('Error accessing data');
                          }
                        },
                      ),
                      if (_dataLoading)
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRejection(String userId) {
    setState(() {
      _dataLoading = true; // Set loading state to true
    });
    Timer(Duration(seconds: 3), () {
      // Delay for 3 seconds
      setState(() {
        _dataLoading = false; // Set loading state to false after delay
      });
    });
  }

  void _handleAcceptance(String userId) {
    _firestore.collection('users').doc(userId).update({
      'accepted': true,
    }).then((value) {
      print('Data accepted successfully');
      _showSuccessMessage(context); // Show success message
    }).catchError((error) {
      print('Failed to accept data: $error');
    });
  }

  Future<void> _storeDataInFile(
      String name, int age, String eligibility) async {
    try {
      // Convert integer age to string
      String ageString = age.toString();

      String data = 'Name: $name\nAge: $ageString\nEligibility: $eligibility\n\n';

      // Specify the path where the file should be stored
      final path = 'C:\Users\sahil\OneDrive\Documents\HCD\accepted_data.txt';
      
      final file = File(path);
      await file.writeAsString(data, mode: FileMode.append);
      print('Data stored in file successfully');

      // Set data loading to true
      setState(() {
        _dataLoading = true;
      });

      // Delay for 10 seconds before resetting data loading to false
      Timer(Duration(seconds: 10), () {
        setState(() {
          _dataLoading = false;
        });
      });
    } catch (e) {
      print('Error storing data in file: $e');
    }
  }

  void _showSuccessMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Success! Your data has been saved. You are selected.'),
        backgroundColor: Colors.green,
      ),
    );
  }
}

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBnNcSNgf16VHYggIWgDm5aELLU7qRM5Cg",
        authDomain: "foodadminpanel-b15da.firebaseapp.com",
        databaseURL: "https://foodadminpanel-b15da-default-rtdb.firebaseio.com",
        projectId: "foodadminpanel-b15da",
        storageBucket: "foodadminpanel-b15da.appspot.com",
        messagingSenderId: "437513836307",
        appId: "1:437513836307:web:aae98982ef0a6437e6ece6",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: QrMenu(),
  ));
}
