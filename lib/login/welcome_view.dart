import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_service/login/login_view.dart';
import 'package:food_service/login/mobile_signin.dart';
import 'package:food_service/login/sign_up_view.dart';
import 'package:food_service/login/signin_otp_view.dart';
import 'package:get/get.dart';

import '../../common/color_extension.dart';
import '../../common_widget/round_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Image.asset(
            "assets/images/splash_bg.png",
            width: media.width,
            height: media.height,
            fit: BoxFit.cover,
          ),
          // Foreground Content
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: media.width * 0.5,
                ),
                SvgPicture.asset(
                'assets/icons/hotel-bell-svgrepo-com.svg',
                height: 200,
                width: 100,
              ),
                Text(
                  "Discover the best foods from over 1,000\nrestaurants and fast delivery to your\nTable",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: TColor.secondaryText,
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: media.width * 0.1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: RoundButton(
                    title: "Sign In with OTP",
                    onPressed: () {
                      Get.to(GettingMobileNoView());
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: RoundButton(
                    title: "Sign Up",
                    type: RoundButtonType.textPrimary,
                    onPressed: () {
                      Get.to(SignUpView());
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
