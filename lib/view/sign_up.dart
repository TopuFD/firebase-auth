import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_login/view/get_token.dart';
import 'package:user_login/widget/custom_textfield.dart';

// ignore: must_be_immutable
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String? sendOtp;

  // create account method
  Future<User?> createAccount(
      BuildContext context, String name, String email, String password) async {
    try {
      User? user = (await auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        await EmailOTP.sendOTP(email: emailController.text);
        var otp = EmailOTP.getOTP();
        setState(() {});
        sendOtp = otp;
        return user;
      } else {
        debugPrint("user not found");
        return null;
      }
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(
          "Sign Up",
          style: TextStyle(
              fontSize: 25, color: Colors.red, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
        child: Column(
          children: [
            const Expanded(child: SizedBox()),
            CustomTextFormField(
                hintText: "User Name", controller: nameController),
            SizedBox(
              height: Get.height * .02,
            ),
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
            const Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                if (nameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    passController.text.isNotEmpty) {
                  createAccount(context, nameController.text,
                          emailController.text, passController.text)
                      .then((user) {
                    if (user != null) {
                      Get.to(OtpCodeScreen(sentOtp: sendOtp!));
                    } else {
                      debugPrint("Creat account faild");
                    }
                  });
                }
              },
              child: Container(
                height: Get.height * .08,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Center(
                    child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20.sp, color: Colors.white),
                )),
              ),
            ),
            SizedBox(
              height: Get.height * .02,
            )
          ],
        ),
      ),
    );
  }
}

// class EmailOTP {
//   static Future<int?> sendOTP({required String email}) async {
//     int generatedOTP = Random().nextInt(900000) + 100000;


//     return generatedOTP;
//   }
// }
