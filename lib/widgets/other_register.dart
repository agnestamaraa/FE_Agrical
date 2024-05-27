import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';

class OtherRegister extends StatelessWidget {
  const OtherRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            '- Or sign up with -',
            style: TextStyle(
              color: GlobalColors.textColor,
              fontWeight: FontWeight.w400,
              fontFamily: 'Inter'
            ),
          ),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: GlobalColors.textMainColor.withOpacity(0.2),
                    blurRadius: 2
                  ),
                ],
              ),
              child: SvgPicture.asset('assets/images/google.svg', height: 30)
            ),
          ],
        ),
      ],
    );
  }
}