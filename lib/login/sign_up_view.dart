import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_service/common/color_extension.dart';
import 'package:food_service/common_widget/round_button.dart';
import 'package:food_service/common_widget/round_textfield.dart';
import 'package:food_service/login/login_view.dart';
import 'package:food_service/login/otp_view.dart';
import 'package:get/get.dart';
import 'package:toasty_box/toast_enums.dart';
import 'package:toasty_box/toast_service.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtAddress = TextEditingController();
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtConfirmPassword = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();

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
                "Sign Up",
                style: TextStyle(
                    color: TColor.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                "Add your details to sign up",
                style: TextStyle(
                    color: TColor.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Name",
                controller: txtName,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Email",
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Address",
                controller: txtAddress,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Password",
                controller: txtPassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundTextfield(
                hintText: "Confirm Password",
                controller: txtConfirmPassword,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(title: "Sign Up", onPressed: signUpWithEmailAndPassword),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Get.off(LoginView());
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Already have an Account? ",
                      style: TextStyle(
                          color: TColor.secondaryText,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Login",
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

 void signUpWithEmailAndPassword() async {
  // Validation for email and password
  String name = txtName.text.trim();
  String email = txtEmail.text.trim();
  String address = txtAddress.text.trim();
  String password = txtPassword.text;
  String confirmPassword = txtConfirmPassword.text;

  // Regular expression for email validation
  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

// Check if password is not empty
  if (name.isEmpty) {
    ToastService.showErrorToast(
      context,
      length: ToastLength.short,
      expandedHeight: 100,
      message: "Please Enter the Name",
    );
    return;
  }
  // Check if email is valid
  if (!emailRegex.hasMatch(email)) {
   ToastService.showErrorToast(
      context,
      length: ToastLength.short,
      expandedHeight: 100,
      message: "Please Enter valid email address",
    );
    return;
  }

  // Check if password is not empty
  if (password.isEmpty) {
    ToastService.showErrorToast(
      context,
      length: ToastLength.short,
      expandedHeight: 100,
      message: "Please Enter the Password",
    );
    return;
  }

  // Check if password matches confirm password
  if (password != confirmPassword) {
    ToastService.showErrorToast(
      context,
      length: ToastLength.short,
      expandedHeight: 100,
      message: "Password and confirm password do not match",
    );
    return;
  }

  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    ToastService.showSuccessToast(
      context,
      length: ToastLength.short,
      expandedHeight: 100,
      message: "Signup Successful",
    );
    Get.off(LoginView());
  } catch (e) {
   
    print("Sign up error: $e");
    ToastService.showErrorToast(
      context,
      length: ToastLength.short,
      expandedHeight: 100,
      message: "$e",
    );
  }
}
}
