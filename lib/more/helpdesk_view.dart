import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_service/common/color_extension.dart';
import 'package:food_service/common_widget/round_button.dart';
import 'package:food_service/global.dart' as global;
import 'my_order_view.dart';

class HelpDeskView extends StatefulWidget {
  const HelpDeskView({super.key});

  @override
  State<HelpDeskView> createState() => _HelpDeskViewState();
}

class _HelpDeskViewState extends State<HelpDeskView> {
    String? tableCode = global.tableCode;
  Future<void> updateHelpStatusToTrue(String tableCode) async {
  try {
    // Update the 'helpStatus' field to true for the specified table code
    DocumentReference tableDocRef = FirebaseFirestore.instance.collection('tables').doc(tableCode);
    await tableDocRef.update({
      'helpStatus': true, 
    });
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Help Generated'),
            content: Text('Your Help is Generated, Our Assistance will Reach you Soon'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    print('Help status updated to true for table code: $tableCode');
  } catch (e) {
    print('Error updating help status to true: $e');
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                     icon: SvgPicture.asset(
                          "assets/icons/leftarrow.svg",
                          width: 30,
                          height: 30,
                        ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        "Help Desk",
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 300,
              ),
              RoundButton(
                        title: "Help!!",
                        onPressed: () {
                          updateHelpStatusToTrue(tableCode!);
                        }),
            ],
          ),
        ),
      ),
    );
  }
}
