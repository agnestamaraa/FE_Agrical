import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';
import 'package:kalender_pertanian_ta/services/userManager.dart';
import 'package:kalender_pertanian_ta/views/login_register/register_screen.dart';
import 'package:kalender_pertanian_ta/widgets/navigationbar.dart';
import 'package:kalender_pertanian_ta/widgets/other_login.dart';
import 'package:kalender_pertanian_ta/widgets/text_format.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? errorMessage;
  bool isLoading = false;

  Future<void> attemptLogin() async {
    final String username = usernameController.text;
    final String password = passwordController.text;

    try {
      final success = await UserManager.login(username, password);

      setState(() {
        isLoading = false;
        if (!success) {
          errorMessage = 'Incorrect username or password. Please try again.';
        }
      });

      if (success) {
        // Navigate to another page on successful login using Get
        Get.off(() => NavBar());
      }
    } catch (e) {
      // Handle different types of exceptions
      setState(() {
        isLoading = false;
        if (e is LoginException) {
          errorMessage = 'Login failed: ${e.message}';
        } else if (e is NetworkException) {
          errorMessage = 'Network error: ${e.message}';
        } else {
          errorMessage = 'Unexpected error occurred. Please try again.';
        }
      });
    }
  }

  @override
    void dispose() {
      // Dispose of the controllers when the widget is disposed.
      usernameController.dispose();
      passwordController.dispose();
      super.dispose();
    }

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
                  controller: usernameController, 
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

                if (errorMessage != null)  // Show error message if present
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      errorMessage!,
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                ),
                
                InkWell(           // nambah respons
                  onTap: (){
                    attemptLogin();
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
                ),

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