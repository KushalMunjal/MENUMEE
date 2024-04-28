import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_service/common/color_extension.dart';
import 'package:food_service/common_widget/round_button.dart';
import 'package:food_service/login/otp_view.dart';
import 'package:get/get.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toast_service.dart';

import 'signin_otp_view.dart';

class GettingMobileNoView extends StatefulWidget {
  static String verify = "";
  const GettingMobileNoView({super.key});

  @override
  State<GettingMobileNoView> createState() => _GettingMobileNoViewState();
}

class _GettingMobileNoViewState extends State<GettingMobileNoView> {
  TextEditingController txtPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 250,
              ),
              Text(
                "Sign in to your account",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "We'll send you a verication code\n to help us keep your account safe",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 60,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: "+91 | Enter Phone Number",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                controller: txtPhone,
                keyboardType: TextInputType.phone,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              RoundButton(
                  title: "Send OTP",
                  onPressed: () {
                    btnSubmit();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  //TODO: Action
  Future<void> btnSubmit() async {
  String countrycode = "+91";
  String phoneNumber = '$countrycode${txtPhone.text}';
  print('Phone number: $phoneNumber');
  
  try {
    // Send OTP using Firebase Authentication
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        // Handle verification failure
        print("Verification Failed: ${e.message}");
        // Show error toast message
        ToastService.showErrorToast(
          context,
          length: ToastLength.medium,
          expandedHeight: 100,
          message: "Verification Failed: ${e.message}",
        );
      },
      codeSent: (String verificationId, int? resendToken) {
        // Navigate to OTP verification screen
        ToastService.showSuccessToast(
          context,
          length: ToastLength.medium,
          expandedHeight: 100,
          message: "OTP Sent Successfully",
        );
        Get.off(SigninOTPView(verificationId: verificationId));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  } catch (e) {
    print("Error sending OTP: $e");
    ToastService.showErrorToast(
      context,
      length: ToastLength.medium,
      expandedHeight: 100,
      message: "Error sending OTP: $e",
    );
  }
}
}