import 'package:flutter/material.dart';
import 'package:food_service/common/color_extension.dart';
import 'package:food_service/common_widget/round_button.dart';
import 'package:food_service/login/otp_view.dart';
import 'package:food_service/common/color_extension.dart';
import 'package:food_service/common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';
import 'new_password_view.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  TextEditingController txtEmail = TextEditingController();

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
                "Reset Password",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),

               const SizedBox(
                height: 15,
              ),

              Text(
                "Please enter your email to receive a\n reset code to create a new password via email",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 60,
              ),
              RoundTextfield(
                hintText: "Your Email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 30,
              ),
             
              RoundButton(title: "Send", onPressed: () {
                btnSubmit();
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OTPView(),
                      ),
                    );
                
              }),
              
            ],
          ),
        ),
      ),
    );
  }

  //TODO: Action
  void btnSubmit() {
  }

  //TODO: ServiceCall

  // void serviceCallForgotRequest(Map<String, dynamic> parameter) {
  //   Globs.showHUD();

  //   ServiceCall.post(parameter, SVKey.svForgotPasswordRequest,
  //       withSuccess: (responseObj) async {
  //     Globs.hideHUD();
  //     if (responseObj[KKey.status] == "1") {
        
  //       Navigator.push(context, MaterialPageRoute(builder: (context) => OTPView(email: txtEmail.text) ) );

        
  //     } else {
  //       mdShowAlert(Globs.appName,
  //           responseObj[KKey.message] as String? ?? MSG.fail, () {});
  //     }
  //   }, failure: (err) async {
  //     Globs.hideHUD();
  //     mdShowAlert(Globs.appName, err.toString(), () {});
  //   });
  // }a
}
