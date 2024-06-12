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
  


  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      (UserManager.checkLoginStatus() == true) 
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