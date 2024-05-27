import 'package:flutter/material.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';
import 'package:kalender_pertanian_ta/views/login_register/login_screen.dart';
import 'package:kalender_pertanian_ta/widgets/button.dart';
import 'package:kalender_pertanian_ta/widgets/other_register.dart';
import 'package:kalender_pertanian_ta/widgets/text_format.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),   // margins
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Buat Akun Baru',
                  style: TextStyle(
                    color: GlobalColors.textMainColor,
                    fontSize: 35,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w900
                  ),
                ),
                // const SizedBox(height: 20),           // buat jarak
                Text(
                  'Daftar sekarang dan Jadi Bagian dari\nAgrical',
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 18,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 38),

                //// First Name Input
                GlobalTextFormat(
                  controller: firstNameController, 
                  text: 'First Name', 
                  obscure: false, 
                  textInputType: TextInputType.name
                ),
                const SizedBox(height: 17),

                //// Last Name Input
                GlobalTextFormat(
                  controller: lastNameController, 
                  text: 'Last Name', 
                  textInputType: TextInputType.name, 
                  obscure: false
                ),
                const SizedBox(height: 17),

                //// Username Input
                GlobalTextFormat(
                  controller: usernameController, 
                  text: 'Username', 
                  textInputType: TextInputType.name, 
                  obscure: false
                ),
                const SizedBox(height: 17),

                //// Email Input
                GlobalTextFormat(
                  controller: emailController, 
                  text: 'Email', 
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
                const SizedBox(height: 17),

                //// Password Input
                GlobalTextFormat(
                  controller: confirmController, 
                  text: 'Confirm Password', 
                  textInputType: TextInputType.text, 
                  obscure: true
                ),
                const SizedBox(height: 38),

                const RegisterButton(),

                const SizedBox(height: 38),

                const OtherRegister(),

                const SizedBox(height: 20),
                // Register
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
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
                          MaterialPageRoute(builder: (context) => LoginScreen()),
                        );
                      },
                    child: Text(
                      'Sign In',
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