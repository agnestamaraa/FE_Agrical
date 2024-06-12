import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:kalender_pertanian_ta/views/calendar_screen/calendarscreen.dart';
import 'package:kalender_pertanian_ta/views/home_screen/home.dart';
import 'package:kalender_pertanian_ta/views/home_screen/homescreen.dart';
import 'package:kalender_pertanian_ta/views/kondisi_lahan/kondisi_lahan.dart';
import 'package:kalender_pertanian_ta/views/login_register/login_screen.dart';
import 'package:kalender_pertanian_ta/views/splash_screen/splash_screen.dart';
import 'package:kalender_pertanian_ta/widgets/navigationbar.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
    @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Kalender Pertanian',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      // getPages: [
      //   GetPage(name: '/', page: () => NavBar()),
      //   GetPage(name: '/home', page: () => HomeTest()),
      //   // GetPage(name: '/home/weatherdetail', page: () => HomeTest()),
      //   GetPage(name: '/information', page: () => KondisiLahan()),
      //   GetPage(name: '/calender', page: () => CalendarScreen())
      // ],
    );
  }

  static void main() {}
}