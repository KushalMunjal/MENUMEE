import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_service/more/about_us_view.dart';
import 'package:food_service/tablefinder/homescreen.dart';
import 'package:food_service/global.dart' as global;
import 'package:firebase_core/firebase_core.dart';
import '../../common/color_extension.dart';
import 'my_order_view.dart';
import 'helpdesk_view.dart';

class MoreView extends StatefulWidget {
  const MoreView({super.key});

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  String? tableCode = global.tableCode;
Future<void> deleteItems(String tableCode) async {
  //  String? tableCode = global.tableCode;
  try {
    // Access the Firestore collection based on the provided table code
    CollectionReference itemsCollection = FirebaseFirestore.instance
        .collection('tables')
        .doc(tableCode)
        .collection('item');

    // Get all documents in the 'items' collection and delete them
    QuerySnapshot snapshot = await itemsCollection.get();
    for (QueryDocumentSnapshot doc in snapshot.docs) {
      await doc.reference.delete();
    }
// Update the main table document
    DocumentReference tableDocRef = FirebaseFirestore.instance.collection('tables').doc(tableCode);
    await tableDocRef.update({
      'status': 'inactive',
      'helpStatus': false, 
    });

    print('Items deleted, status updated to inactive, and helpStatus set to false for table code: $tableCode');
  } catch (e) {
    print('Error deleting items: $e');
  }
}
  List moreArr = [
    {
      "index": "1",
      "name": "Payment Details",
      "image": "assets/images/more_payment.png",
      "base": 0
    },
    {
      "index": "2",
      "name": "My Orders",
      "image": "assets/images/more_my_order.png",
      "base": 0
    },
    {
      "index": "3",
      "name": "Help Desk",
      "image": "assets/images/more_notification.png",
      "base": 0
    },
    {
      "index": "4",
      "name": "About Us",
      "image": "assets/images/more_info.png",
      "base": 0
    },
    {
      "index": "5",
      "name": "Logout",
      "image": "assets/images/more_info.png",
      "base": 0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "More",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: moreArr.length,
                  itemBuilder: (context, index) {
                    var mObj = moreArr[index] as Map? ?? {};
                    var countBase = mObj["base"] as int? ?? 0;
                    return InkWell(
                      onTap: () {
                        switch (mObj["index"].toString()) {
                          case "1":

                            break;

                          case "2":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyOrderView()));
                          case "3":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HelpDeskView()));
                          case "4":
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AboutUsView()));
                          case "5":
                            deleteItems(tableCode!);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomeScreen()));

                          default:
                        }
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        child: Stack(
                          alignment: Alignment.centerRight,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              decoration: BoxDecoration(
                                  color: TColor.textfield,
                                  borderRadius: BorderRadius.circular(5)),
                              margin: const EdgeInsets.only(right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 50,
                                    height: 50,
                                    padding: const EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: TColor.placeholder,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    alignment: Alignment.center,
                                    child: Image.asset(mObj["image"].toString(),
                                        width: 25,
                                        height: 25,
                                        fit: BoxFit.contain),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Expanded(
                                    child: Text(
                                      mObj["name"].toString(),
                                      style: TextStyle(
                                          color: TColor.primaryText,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  if (countBase > 0)
                                    Container(
                                      padding: const EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(12.5)),
                                      alignment: Alignment.center,
                                      child: Text(
                                        countBase.toString(),
                                        style: TextStyle(
                                            color: TColor.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  color: TColor.textfield,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Image.asset("assets/images/btn_next.png",
                                  width: 10,
                                  height: 10,
                                  color: TColor.primaryText),
                            ),
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
