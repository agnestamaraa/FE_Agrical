import 'package:flutter/material.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';
import 'package:kalender_pertanian_ta/views/login_register/register_screen.dart';
import 'package:kalender_pertanian_ta/widgets/button.dart';
import 'package:kalender_pertanian_ta/widgets/other_login.dart';
import 'package:kalender_pertanian_ta/widgets/text_format.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 77, 20, 60),   // margins
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang',
                  style: TextStyle(
                    color: GlobalColors.textMainColor,
                    fontSize: 35,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900
                  ),
                ),
                // const SizedBox(height: 20),           // buat jarak
                Text(
                  'Wujudkan panen impian Anda dengan Agrical',
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 38),

                //// Email/Username Input
                GlobalTextFormat(
                  controller: emailController, 
                  text: 'Email/Username', 
                  textInputType: TextInputType.text, 
                  obscure: false
                ),
                const SizedBox(height: 17),

                //// Password Input
                GlobalTextFormat(
                  controller: passwordController, 
                  text: 'Password', 
                  textInputType: TextInputType.text, 
                  obscure: true
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        // ke page forgot password
                      },
                      child: Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: GlobalColors.textMainColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          fontFamily: 'Inter'
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 38),

                const LoginButton(),

                const SizedBox(height: 38),

                const OtherLogin(),

                const SizedBox(height: 180),
                // Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t have an account?',
                      style: TextStyle(
                        color: GlobalColors.textColor,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 14
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterScreen()),
                        );
                      },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: GlobalColors.textMainColor,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        fontSize: 14
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}