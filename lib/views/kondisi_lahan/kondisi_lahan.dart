import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';
import 'package:kalender_pertanian_ta/views/profile_screen/profilescreen.dart';

class KondisiLahan extends StatefulWidget {
  const KondisiLahan({super.key});

  @override
  _KondisiLahanState createState() => _KondisiLahanState();
}

class _KondisiLahanState extends State<KondisiLahan> {
  bool _isIrrigationOn = true; // State variable for the switch

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
                  // Row(
                  //   children: [
                  //     IconButton(
                  //       icon: Icon(Icons.notifications),
                  //       onPressed: () {
                  //         // hgcvhg
                  //       },
                  //     ),
                  //     IconButton(
                  //       icon: Icon(Icons.account_circle),
                  //       onPressed: () {
                  //         Navigator.push(
                  //           context,
                  //           MaterialPageRoute(builder: (context) => ProfileScreen())
                  //         );
                  //       },
                  //     ),
                  //   ],
                  // ),
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
        
                      Container(
                        // color: Colors.white,
                        child: GridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            infoCard('Temperatur', '21°', 'Cerah berawan'),
                            infoCard('Kelembaban', '52%', 'Normal'),
                            infoCard('Presipitasi', '45%', 'Normal'),
                            infoCard('Titik Embun', '26°', 'Normal'),
                            infoCard('Titik Embun', '26°', 'Normal'),
                            infoCard('Titik Embun', '26°', 'Normal'),
                          ],
                        ),
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
                              ),
                              SizedBox(height: 8),
                              Text('Status Irigasi'),
                              SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('ON'),
                                  Switch(
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
  return Card(
    color: Colors.white,
    child: Padding(
      padding: const  EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          SizedBox(height: 8),

          Text(
            value,
            style: TextStyle(
              fontSize: 32,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 8),

          Text(
            status,
            style: TextStyle(fontSize: 16),
          )
        ],
      ),
    ),
  );
}
