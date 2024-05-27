import 'package:flutter/material.dart';

class GlobalButtonn extends StatelessWidget {
  final VoidCallback onTap;
  final double? buttonWidth;
  final double? buttonHeight;
  final String buttonText;
  final Color buttonTextColor;
  final double fontSize;
  final Color buttonColor;
  
  const GlobalButtonn(
    {Key? key,
    required this.onTap,
    required this.buttonText, 
    required this.buttonTextColor,
    required this.fontSize,
    this.buttonWidth,
    this.buttonHeight,
    required this.buttonColor,
    // this.buttonColor = GlobalColors.mainColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        minimumSize: Size(
          buttonWidth ?? MediaQuery.of(context).size.width,
          buttonHeight ?? MediaQuery.of(context).size.height
        ),
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80)
        ),

      ),
      child: Center(
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: fontSize,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            color: buttonTextColor
          ),
        ),
      )
    );
  }
}