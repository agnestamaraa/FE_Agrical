import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';
import 'package:kalender_pertanian_ta/model/conditionmodel.dart';
import 'package:kalender_pertanian_ta/views/kondisi_lahan/infoCardLoading.dart';
import 'package:kalender_pertanian_ta/services/conditionService.dart';

class KondisiLahan extends StatefulWidget {
  const KondisiLahan({super.key});

  @override
  _KondisiLahanState createState() => _KondisiLahanState();
}

class _KondisiLahanState extends State<KondisiLahan> {
  bool _isIrrigationOn = true; // State variable for the switch

  late Future<ConditionModel> conditionData;

  @override
  void initState(){
    super.initState();
    conditionData = ConditionService().getCondition();
    log(conditionData.toString());
    print(conditionData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Informasi Lahan',
                        style: TextStyle(
                          color: GlobalColors.textMainColor,
                          fontSize: 24, 
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(height: 8)
                    ],
                  ),
                ],
              ),
        
        SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.2),
                          )
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10),
                            Icon(Icons.location_on_rounded),
                            SizedBox(width: 2),
                            Text(
                              'Lahan A, Sumedang',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Detail Informasi',
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: 10),
        
                      FutureBuilder<ConditionModel>(
                        future: conditionData,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return loadingCardGrid();
                          } else if (snapshot.hasError) {
                            return Text('Error Fetching API, Error: ${snapshot.error}');
                          } else if (!snapshot.hasData) {
                            return Text('No data available');
                          } else {
                            final condition = snapshot.data;
                            return GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                infoCard('Temperatur', '${condition!.temperature}', '${condition.iconPhrase}'),
                                infoCard('Kelembaban', '${condition.humidity}', '%'),
                                infoCard('Intensitas Cahaya', '${condition.lux.toStringAsFixed(2)}', 'lx'),
                                infoCard('Radiasi Surya', '${condition.solarRadiation.toStringAsFixed(2)}', 'W/m²'),
                                infoCard('Tekanan', '${condition.pressure.toStringAsFixed(2)}', 'hPa'),
                                infoCard('Kecepatan Angin', '${condition.windSpeed.toStringAsFixed(2)}', 'm/s'),
                                infoCard('Arah Angin', '${condition.windDirection.toStringAsFixed(2)}°', ''),
                                infoCard('Kelembaban Tanah', '${condition.moisture.toStringAsFixed(2)}', '%'),
                              ],
                            );
                         };
                        },
                      ),
                      SizedBox(height: 16),
        
                      Text(
                        'Irigasi',
                        style: TextStyle(
                          fontSize: 20, 
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      SizedBox(height: 10),
        
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.black.withOpacity(0.2)
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Volume air di dalam tangki saat ini',

                            ),
                              SizedBox(height: 8),
                              LinearProgressIndicator(
                                value: 0.2,
                                minHeight: 10,
                                color: GlobalColors.mainColor,
                              ),
                              SizedBox(height: 8),
                              Text('Status Irigasi'),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('ON'),
                                  Switch(
                                    activeColor: GlobalColors.backgroundColor,
                                    activeTrackColor: GlobalColors.mainColor,
                                    inactiveThumbColor: GlobalColors.textColor,
                                    inactiveTrackColor: GlobalColors.backgroundColor,
                                    value: _isIrrigationOn, 
                                    onChanged: (bool value) {
                                      setState(() {
                                        _isIrrigationOn = value;
                                      });
                                    },
                                  ),
                                  Text('OFF'),
                                ],
                              ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
        
                     
                        ],
                      ),
                  ),
                ),
            ])),
      ));
  }
}

Widget infoCard(String title, String value, String status) {
  
  List<String> split = title.split(" ");

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
      padding: const  EdgeInsets.all(12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          (split.length == 2) 
            ? 
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  split[0],
                  style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  color: GlobalColors.textMainColor
                  ),
                ),
                Text(
                  split[1],
                  style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  color: GlobalColors.textMainColor
                  ),
                ),
              ],
            )
            : 
            Text(
                split[0],
                style: TextStyle(
                fontSize: 14,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: GlobalColors.textMainColor
                ),
              ),

          Text(
            value,
            style: TextStyle(
              fontSize: 26,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              color: GlobalColors.mainColor
            ),
          ),

          Text(
            status,
            style: TextStyle(
              fontSize: 16,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              color: GlobalColors.textMainColor
            ),
          )
        ],
      ),
    ),
  );
}
