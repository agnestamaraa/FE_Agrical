// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';
import 'package:kalender_pertanian_ta/services/userManager.dart';
import 'package:kalender_pertanian_ta/views/home_screen/home.dart';
import 'package:kalender_pertanian_ta/widgets/navigationbar.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  void _login() async {
    await UserManager.login("Asep");
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(           // nambah respons
      onTap: (){
        debugPrint(UserManager.isLoggedIn.toString());
        _login();
        Get.off(() => NavBar());
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          color: GlobalColors.mainColor,
          borderRadius: BorderRadius.circular(80),
        ),
        child: const Text(
          'Sign In',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter'
          ),
        ),
      ),
    );
  }
}

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(           // nambah respons
      onTap: (){
        // print('Login');
        Navigator.pushReplacement(
          context, 
          MaterialPageRoute(builder: (context) => const NavBar()),
        );
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        decoration: BoxDecoration(
          color: GlobalColors.mainColor,
          borderRadius: BorderRadius.circular(80),
        ),
        child: const Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter'
          ),
        ),
      ),
    );
  }
}