import 'dart:async';

import 'package:ecommers/presentation/ui/screens/otp_verification_screen.dart';
import 'package:ecommers/presentation/ui/utils/app_colors.dart';
import 'package:ecommers/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const AppLogoWidget(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                'Please Enter Your Email Address',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: _moveToOtp,
                child: const Text('Next',style: TextStyle(fontSize: 16),),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void _moveToOtp(){
    Get.to(()=>const OtpVerificationScreen());
  }

}
