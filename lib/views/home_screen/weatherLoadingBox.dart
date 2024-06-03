// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';

class weatherLoadingbar extends StatefulWidget {
  final String status;

  const weatherLoadingbar({this.status = '', Key? key}) : super(key: key);

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
          Container(
            child: widget.status.isEmpty
              ? CircularProgressIndicator(
                strokeWidth: 9.0, // Customize the width of the circular track
                backgroundColor: Colors.white, // Background color of the track
              )
              : Text(widget.status,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'Inter'
              ),),
          )
        ],
      )
    );
  }
}