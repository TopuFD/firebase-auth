import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:user_login/home_screen.dart';
import 'package:user_login/widget/custom_textfield.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  Future<User?> createAccount(
      String name, String email, String password) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    try {
      User? user = (await auth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      if (user != null) {
        debugPrint("Account successfull");
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
            Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                if (nameController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    passController.text.isNotEmpty) {
                  createAccount(nameController.text, emailController.text,
                          passController.text)
                      .then((user) {
                    if (user != null) {
                      Get.to(HomeScreen());
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
