import 'package:flutter/material.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';
import 'package:kalender_pertanian_ta/views/kondisi_lahan/infoCard.dart';

class loadingCardGrid extends StatelessWidget {
  final String condition;
  const loadingCardGrid({super.key, this.condition = ''});

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
                loadingCard(condition: condition,),
                loadingCard(condition: condition,),
                loadingCard(condition: condition,),
                loadingCard(condition: condition,),
                loadingCard(condition: condition,),
                loadingCard(condition: condition,),
              ],
            ),
    );
  }
}