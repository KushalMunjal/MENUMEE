import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_service/tabview/main_tabview.dart';
import 'package:food_service/common_widget/round_textfield.dart';
import 'package:food_service/global.dart' as global;
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HomeScreen extends StatefulWidget {
 

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  TextEditingController codeController = TextEditingController();
  


  Future<void> authenticateUser(String inputCode) async {
    bool isValid = await checkCodeFromFirestore(inputCode);

    if (isValid) {
      global.setTableCode(inputCode);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MainTabView()),
      );
    } else {
      
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Code'),
            content: Text('The entered code is invalid.'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
Future<bool> checkCodeFromFirestore(String inputCode) async {
  try {
    var querySnapshot = await FirebaseFirestore.instance
        .collection('tables')
        .where('tableCode', isEqualTo: inputCode)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // If the tableCode exists, update the status to 'active'
      await updateStatusInFirestore(inputCode);
      return true;
    } else {
      return false;
    }
  } catch (e) {
    print('Error checking code: $e');
    return false;
  }
}
Future<void> updateStatusInFirestore(String inputCode) async {
  try {
    
    var querySnapshot = await FirebaseFirestore.instance
        .collection('tables')
        .where('tableCode', isEqualTo: inputCode)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      // If the document(s) exist with the matching tableCode, update the status
      for (var docSnapshot in querySnapshot.docs) {
        var documentReference = docSnapshot.reference;
        // Update the 'status' field of the document to 'active'
        await documentReference.update({'status': 'active'});
      }
      print('Status updated to active for tableCode: $inputCode');
    } else {
      print('No document found with tableCode: $inputCode');
    }
  } catch (e) {
    print('Error updating status: $e');
  }
}

  Future<void> _qrScanner() async {
    var cameraStatus = await Permission.camera.status;
    if (cameraStatus.isGranted) {
      String? qrData = await scanner.scan();
      if (qrData != null) {
        authenticateUser(qrData);
      }
    } else {
      var isGranted = await Permission.camera.request();
      if (isGranted.isGranted) {
        String? qrData = await scanner.scan();
        if (qrData != null) {
          authenticateUser(qrData);
        }
      }
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(38, 2, 139, 252),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // SvgPicture.asset(
              //   'assets/icons/bellboy-svgrepo-com.svg',
              //   height: 200,
              //   width: 100,
              // ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  "Scan QR \n      OR\nEnter Code",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Text(
                  "Hint: QR/Code Will be Available \n at your Desk",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              RoundTextfield(
                controller: codeController,
                hintText: 'Enter Table Code',
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  
                  authenticateUser(codeController.text);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  minimumSize: Size(double.infinity, 50.0),
                ),
                child: Text(
                  'ENTER CODE',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _qrScanner();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 173, 218, 255),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28.0),
                  ),
                  minimumSize: Size(double.infinity, 50.0),
                ),
                child: Text(
                  'SCAN QR',
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 2, 139, 252)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
