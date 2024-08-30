import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_login/sign_up.dart';
import 'package:user_login/widget/custom_textfield.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Login",
          style: TextStyle(
              fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(child: SizedBox()),
            CustomTextFormField(hintText: "Email", controller: emailController),
            SizedBox(
              height: Get.height * .02,
            ),
            CustomTextFormField(
              obscureText: true,
              hintText: "Password",
              controller: passController,
              suffixIcon: const Icon(Icons.visibility_off),
            ),
            SizedBox(
              height: Get.height * .05,
            ),
            Container(
              height: Get.height * .08,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Center(
                  child: Text(
                "Login",
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
              )),
            ),
            const Expanded(child: SizedBox()),
            RichText(
                text: TextSpan(children: [
              const TextSpan(
                  text: "Don\'t have any Account? ",
                  style: TextStyle(fontSize: 18, color: Colors.black)),
              TextSpan(
                  text: "SignUp",
                  style: const TextStyle(fontSize: 18, color: Colors.green),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Get.to(SignUp());
                    }),
            ])),
            SizedBox(
              height: Get.height * .02,
            )
          ],
        ),
      ),
    );
  }
}
