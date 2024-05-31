import 'package:flutter/material.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';

class weatherLoadingbar extends StatefulWidget {
  const weatherLoadingbar({super.key});

  @override
  State<weatherLoadingbar> createState() => _weatherLoadingbarState();
}

class _weatherLoadingbarState extends State<weatherLoadingbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      width: double.infinity, // menyesuaikan dengan layar
      height: 400,
      decoration: BoxDecoration(
        color: GlobalColors.mainColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator()
        ],
      )
    );
  }
}