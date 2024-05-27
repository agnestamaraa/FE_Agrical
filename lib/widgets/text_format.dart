import 'package:flutter/material.dart';
// import 'package:get/get.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';

class GlobalTextFormat extends StatelessWidget {
  const GlobalTextFormat(
    {super.key, 
    required this.controller, 
    required this.text, 
    required this.textInputType, 
    required this.obscure});
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: GlobalColors.textColor.withOpacity(0.4),
            blurRadius: 2
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: text,
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(vertical: 16),
          hintStyle: const TextStyle(
            height: 1,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400
          ),
        ),
      ),
    );
  }
}