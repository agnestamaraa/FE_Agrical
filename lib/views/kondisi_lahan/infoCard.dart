import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';

class loadingCard extends StatelessWidget {
  final String condition;

  const loadingCard({super.key, this.condition = ""});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: GlobalColors.mainColor,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const  EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (condition == '') 
              ? CircularProgressIndicator() 
              : Text(condition)
          ],
        ),
      ),
    );
  }
}