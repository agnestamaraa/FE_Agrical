import 'package:flutter/material.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';
import 'package:intl/intl.dart';
import 'package:kalender_pertanian_ta/model/pricemodel.dart';
import 'package:kalender_pertanian_ta/model/salesmodel.dart';
import 'package:kalender_pertanian_ta/services/priceService.dart';
import 'package:kalender_pertanian_ta/services/salesService.dart';

class PenjualanTertinggi extends StatefulWidget {
  const PenjualanTertinggi({super.key});

  @override
  State<PenjualanTertinggi> createState() => _PenjualanTertinggiState();
}

class _PenjualanTertinggiState extends State<PenjualanTertinggi> {
  
  late Future<SalesModel> salesData;
  late Future<PriceModel> priceData;

  @override
  void initState() {
    super.initState();
    salesData = SalesService().getSales();
    priceData = PriceService().getPrice();
  }
  
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
                child: FutureBuilder<SalesModel>(
                  future: salesData,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error Fetching API, Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      return Text('No data available');
                    } else {
                      final sales = snapshot.data;
                      return Container(
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
                              '${sales!.tanaman}',
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
                                  sales!.volumePenjualan.toString(),
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    color: GlobalColors.textMainColor
                                  ),
                                ),
                                const SizedBox(width: 3),
                                Text(
                                  'kg',
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
                      );
                    }
                  } 
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
                child: FutureBuilder<PriceModel>(
                  future: priceData,
                  builder:(context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error Fetching API, Error: ${snapshot.error}');
                    } else if (!snapshot.hasData) {
                      return Text('No data available');
                    } else {
                      final price = snapshot.data;
                      return Container(
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
                              '${price!.tanaman}',
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
                                  rupiahCurrency.format(price.hargaJual),
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
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
