import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:user_login/view/home_screen.dart';

// ignore: must_be_immutable
class OtpCodeScreen extends StatelessWidget {
  OtpCodeScreen({super.key, required this.sentOtp});
  final String sentOtp;
  TextEditingController enteredOtp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
            child: Column(
              children: [
                Text(
                  "Email Verification",
                  style: TextStyle(fontSize: 30.sp, color: Colors.red),
                ),
                SizedBox(
                    width: Get.width / 1.5,
                    child: const Divider(
                      color: Colors.red,
                    )),
                SizedBox(
                  height: Get.height * .05,
                ),
                PinCodeTextField(
                  controller: enteredOtp,
                  appContext: context,
                  length: 6,
                  obscureText: false,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    inactiveColor: const Color(0x42494949),
                    inactiveFillColor: Colors.white,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5.r),
                    fieldHeight: size.height * .07,
                    fieldWidth: size.width * .13,
                    activeFillColor: Colors.white,
                  ),
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
                Text(
                  "check your email and copy the OTP code",
                  style: TextStyle(fontSize: 16.sp, color: Colors.black),
                ),
                InkWell(
                  onTap: () {
                    if (enteredOtp.text == sentOtp) {
                      debugPrint("entred otp : $enteredOtp");
                      debugPrint("sendotp otp : $sentOtp");
                      Get.to(const HomeScreen());
                    }
                  },
                  child: Container(
                    height: Get.height * .08,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                        child: Text(
                      "Verify",
                      style: TextStyle(fontSize: 20.sp.sp, color: Colors.white),
                    )),
                  ),
                ),
                SizedBox(
                  height: Get.height * .02,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
