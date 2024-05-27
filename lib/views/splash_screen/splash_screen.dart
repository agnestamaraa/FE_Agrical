import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kalender_pertanian_ta/views/login_register/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {
      Get.to(LoginScreen());
    });
    return Scaffold(
      body: Center(         // buat bikin di tengah
        child: Hero( 
          tag: "Logo",
          child: Image.asset('assets/images/splashlogo.png')
        ),
      ),
    );
  }
}