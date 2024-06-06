import 'package:flutter/material.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';
import 'package:intl/intl.dart';

class PenjualanTertinggi extends StatelessWidget {
  const PenjualanTertinggi({super.key});

  @override
  Widget build(BuildContext context) {
    final rupiahCurrency = new NumberFormat.currency(locale: "id", symbol: "Rp", decimalDigits: 0);
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    // double height = size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          children:<Widget>[
            Container(
              width: width*0.43,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: GlobalColors.textColor.withOpacity(0.2),
                  width: 2
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.bar_chart_sharp,
                        color: GlobalColors.textColor,
                      ),
                    ),
            
                    const SizedBox(height: 5),
                    Text(
                      'Penjualan',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: GlobalColors.textMainColor
                      ),
                    ),
                    Text(
                      'Tertinggi',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: GlobalColors.textMainColor
                      ),
                    ),
            
                    const SizedBox(height: 3),
                    Text(
                      'Beras:',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: GlobalColors.textColor
                      ),
                    ),
            
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Text(
                          rupiahCurrency.format(12050),
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: GlobalColors.textMainColor
                          ),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '/kg',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: GlobalColors.textColor
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 15),
            Container(
              width: width*0.43,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: GlobalColors.textColor.withOpacity(0.2),
                  width: 2
                ),
              ),

              child: Padding(
                padding: EdgeInsets.only(left: 16, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.money_rounded,
                        color: GlobalColors.textColor,
                      ),
                    ),
            
                    const SizedBox(height: 5),
                    Text(
                      'Harga Jual',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: GlobalColors.textMainColor
                      ),
                    ),
                    Text(
                      'Tertinggi',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: GlobalColors.textMainColor
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Bawang Merah:',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        color: GlobalColors.textColor
                      ),
                    ),
            
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        Text(
                          rupiahCurrency.format(62011),
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: GlobalColors.textMainColor
                          ),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          '/kg',
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w500,
                            color: GlobalColors.textColor
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}