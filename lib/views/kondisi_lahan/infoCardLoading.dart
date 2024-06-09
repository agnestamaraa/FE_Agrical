import 'package:flutter/material.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';

class loadingCardGrid extends StatelessWidget {
  const loadingCardGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child:GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                loadingCard(),
                loadingCard(),
                loadingCard(),
                loadingCard(),
                loadingCard(),
                loadingCard(),
              ],
            ),
    );
  }
}

Widget loadingCard() {
  return Card(
    color: Colors.white,
    surfaceTintColor: Colors.white,
    shape: RoundedRectangleBorder(
      side: BorderSide(
        color: GlobalColors.mainColor
      ),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Padding(
      padding: const  EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
        ],
      ),
    ),
  );
}