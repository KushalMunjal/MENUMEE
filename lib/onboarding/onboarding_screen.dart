import 'package:flutter/material.dart';
import 'package:food_service/tablefinder/homescreen.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int selectPage = 0;
  PageController controller = PageController();

  List pageArr = [
    {
      "title": "Welcome",
      "subtitle":
          "It's a Pleasure to meet you \n We're Exiceted to See You doorstep \n Let's get Started",
      "animation": "assets/animations/bell.json",
    },
    {
      "title": "Order Food You Love",
      "subtitle": " Easily Find your Type of Food and \n Order it Ease. \n",
      "animation": "assets/animations/logo.json",
    },
    {
      "title": "Scan & GO",
      "subtitle":
          "Scan the QR OR Enter Table Code \n Access the Menu and BOOM!!",
      "animation": "assets/animations/scanner.json",
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: ((context, index) {
              var pObj = pageArr[index] as Map? ?? {};
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Positioned(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          height: 60,
                          width: 60,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "MENUMEE",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.1,
                  ),
                  Container(
                    width: media.width,
                    height: media.width,
                    alignment: Alignment.center,
                    child: Lottie.asset(
                      pObj["animation"].toString(),
                      width: media.width * 0.60,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: media.width * 0.2,
                  ),
                  Text(
                    pObj["title"].toString(),
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    pObj["subtitle"].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: media.width * 0.20,
                  ),
                ],
              );
            }),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: media.height * 0.6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: pageArr.map((e) {
                  var index = pageArr.indexOf(e);

                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                        color: index == selectPage ? Colors.blue : Colors.black,
                        borderRadius: BorderRadius.circular(4)),
                  );
                }).toList(),
              ),
              SizedBox(
                height: media.height * 0.28,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        10), // Adjust the radius as needed
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28),
                      ),
                    ),
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      if (selectPage >= 2) {
                        // Home Screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } else {
                        // Next Screen
                        setState(() {
                          selectPage = selectPage + 1;
                          controller.animateToPage(
                            selectPage,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.bounceInOut,
                          );
                        });
                      }
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
