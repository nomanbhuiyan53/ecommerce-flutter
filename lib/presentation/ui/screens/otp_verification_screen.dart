import 'dart:async';

import 'package:ecommers/presentation/ui/screens/complete_profile_screen.dart';
import 'package:ecommers/presentation/ui/utils/app_colors.dart';
import 'package:ecommers/presentation/ui/widgets/app_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  int _start = 120; // Countdown starts from 120 seconds
  Timer? _timer;
  bool _isButtonEnabled = false;
  @override
  void initState() {
    super.initState();
    _startTimer();
  }
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_start > 0) {
        setState(() {
          _start--;
        });
      } else {
        _timer?.cancel();
        setState(() {
          _isButtonEnabled = true; // Enable the button when countdown is over
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
                  'Enter OTP Code',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  'A 4 Digit OTP has been send to email',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 20,
                ),
                PinCodeTextField(
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    activeColor: AppColors.themeColor,
                    selectedColor: Colors.green,
                    selectedFillColor: Colors.white,
                    inactiveColor: AppColors.themeColor,
                    inactiveFillColor: Colors.white,
                    fieldHeight: 50,
                    fieldWidth: 40,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  onCompleted: (v) {
                    print("Completed");
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                  appContext: context,
                ),
                const SizedBox(
                  height: 18,
                ),
                ElevatedButton(
                  onPressed:  _moveToCompleteProfileScreen,
                  child: const Text(
                    'Next',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                RichText(
                  text: TextSpan(
                      text: 'This Code Will Expire in ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                          text:  '$_start s',
                          style: TextStyle(color: AppColors.themeColor,fontWeight: FontWeight.bold),
                        ),
                      ]),
                ),
                TextButton(
                  onPressed:_isButtonEnabled ? () {

                  }: null,
                  child: const Text(
                    'Resent Code',
                    style: TextStyle(color: AppColors.themeColor,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  void _moveToCompleteProfileScreen(){
    Get.off(const CompleteProfileScreen());
  }
  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
