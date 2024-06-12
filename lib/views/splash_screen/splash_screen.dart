import 'dart:async';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalender_pertanian_ta/services/userManager.dart';
import 'package:kalender_pertanian_ta/views/home_screen/homescreen.dart';
import 'package:kalender_pertanian_ta/views/login_register/login_screen.dart';
import 'package:kalender_pertanian_ta/widgets/navigationbar.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
  Future<bool> _checkLoginStatus() async {
    // Perform whatever logic you need to check if the user is logged in
    // For example, you might check if there's a stored token, or other session data

    // For simplicity, UserManager.isLoggedIn is used here
    return UserManager.isLoggedIn;
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      debugPrint(UserManager.isLoggedIn.toString());
      (_checkLoginStatus() == true) 
        ? Get.off(() => NavBar())
        : Get.off(() => LoginScreen());
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(         // buat bikin di tengah
        child: Hero( 
          tag: "Logo",
          child: Image.asset('assets/images/splashlogo.png')
        ),
      ),
    );
  }
}