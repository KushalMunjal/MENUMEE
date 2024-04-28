import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_service/common/color_extension.dart';
import 'package:food_service/common_widget/round_button.dart';
import 'package:food_service/login/mobile_signin.dart';
import 'package:food_service/outlet/outlet_view.dart';
import 'package:get/get.dart';
import 'package:otp_pin_field/otp_pin_field.dart';
import 'package:toasty_box/toasty_box.dart';

class SigninOTPView extends StatefulWidget {
  final String verificationId;

  SigninOTPView({required this.verificationId});

  @override
  State<SigninOTPView> createState() => _OTPViewState();
}

class _OTPViewState extends State<SigninOTPView> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  String code = "";

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
                height: 64,
              ),
              Text(
                "Verify your phone number",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "OTP has been sent to your phone number",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 60,
              ),
              SizedBox(
                height: 60,
                child: OtpPinField(
                    key: _otpPinFieldController,
                    autoFillEnable: true,
                    textInputAction: TextInputAction.done,
                    onSubmit: (newCode) {
                      code = newCode;
                    },
                    onChange: (newCode) {
                      code = newCode;
                    },
                    onCodeChanged: (newCode) {
                      code = newCode;
                    },
                    fieldWidth: 40,
                    otpPinFieldStyle: OtpPinFieldStyle(
                        defaultFieldBorderColor: Colors.transparent,
                        activeFieldBorderColor: Colors.transparent,
                        defaultFieldBackgroundColor: TColor.textfield,
                        activeFieldBackgroundColor: TColor.textfield
                       ),
                    maxLength: 6,
                    showCursor: true,
                    cursorColor: TColor.placeholder,
                    upperChild: const Column(
                      children: [
                        SizedBox(height: 30),
                        Icon(Icons.flutter_dash_outlined, size: 150),
                        SizedBox(height: 20),
                      ],
                    ),
                    showCustomKeyboard: false,
                    cursorWidth: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration),
              ),
              const SizedBox(
                height: 30,
              ),
              RoundButton(
                  title: "Continue",
                  onPressed: () async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: widget.verificationId,
                              smsCode: code);
                      await auth.signInWithCredential(credential);
                      Get.to(OutletViewState());
                    } catch (e) {}
                  }),
              TextButton(
                onPressed: () {},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Didn't Received? ",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Click Here",
                      style: TextStyle(
                          color: TColor.primary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
