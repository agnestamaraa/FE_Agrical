import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:kalender_pertanian_ta/consts/global.colors.dart';
import 'package:kalender_pertanian_ta/model/weathermodel.dart';
import 'package:kalender_pertanian_ta/views/home_screen/infotertinggi.dart';
import 'package:kalender_pertanian_ta/views/home_screen/prakiraancuaca.dart';
import 'package:kalender_pertanian_ta/views/profile_screen/profilescreen.dart';
import 'package:kalender_pertanian_ta/widgets/button_global.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;

class HomeTest extends StatefulWidget {
  const HomeTest({super.key});

  @override
  State<HomeTest> createState() => _HomeTestState();
}

class _HomeTestState extends State<HomeTest> {
  final List<String> items = [
    'Cikembulan',
    'Cimalaka',
    'Cimanggu',
    'Cipacing',
    'Jatinangor',
    'Tanjungkerta',
    'Sukamantri',
    'Cisitu',
  ];

  List<_SalesData> data = [
    _SalesData('Kentang', 35),
    _SalesData('Kacang', 28),
    _SalesData('Cabai', 40),
    _SalesData('Beras', 32),
    _SalesData('Jagung', 34)
  ];

  late Future<WeatherModel> weatherData;

  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    weatherData = _getWeatherFromUrl('https://agricalbackend-production.up.railway.app/latestweathercondition');
    print("AAAA");
    print(weatherData);

  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            // Greetings
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Hai, Juan!
                Text(
                  'Hai, Juan!',
                  style: TextStyle(
                      color: GlobalColors.textMainColor,
                      fontSize: 24,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700
                  ),
                ),

                // Notification icon
                Row(
                  children: [
                    IconButton(
                      onPressed: () {

                      }, 
                      icon: Icon(Icons.notifications)
                    ),
                    // const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProfileScreen())
                        );
                      }, 
                      icon: Icon(Icons.account_circle)
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 10),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // search bar
                    DropdownButtonHideUnderline(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: GlobalColors.textColor, width: 1.0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text(
                            'Pilih Lokasi',
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).hintColor,
                            ),
                          ),
                          items: items
                              .map((item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value;
                            });
                          },
                          buttonStyleData: const ButtonStyleData(
                              padding: EdgeInsets.only(left: 0, right: 9),
                              height: 40),
                          dropdownStyleData: const DropdownStyleData(
                            maxHeight: 200,
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                          ),
                          dropdownSearchData: DropdownSearchData(
                            searchController: textEditingController,
                            searchInnerWidgetHeight: 50,
                            searchInnerWidget: Container(
                              height: 50,
                              padding: const EdgeInsets.only(
                                top: 8,
                                bottom: 8,
                                right: 8,
                                left: 8,
                              ),
                              child: TextFormField(
                                expands: true,
                                maxLines: null,
                                controller: textEditingController,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  hintText: 'Cari Lokasi',
                                  hintStyle: const TextStyle(fontSize: 14),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ),
                            searchMatchFn: (item, searchValue) {
                              return item.value
                                  .toString()
                                  .contains(searchValue);
                            },
                          ),
                          //This to clear the search value when you close the menu
                          onMenuStateChange: (isOpen) {
                            if (!isOpen) {
                              textEditingController.clear();
                            }
                          },
                        ),
                      ),
                    ),

                    // Cuaca hari ini
                    
                    FutureBuilder<WeatherModel>(
                        future: weatherData,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (!snapshot.hasData) {
                            return Text('No data available');
                          } else {
                            final weather = snapshot.data;
                            return Container(
                              margin: const EdgeInsets.only(top: 20),
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                              width: double.infinity, // menyesuaikan dengan layar
                              decoration: BoxDecoration(
                                color: GlobalColors.mainColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              weather!.dateInfo,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ]),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Hari Ini',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            weather.time,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  // icon cuaca
                                  Container(
                                    margin: const EdgeInsets.only(top: 20),
                                    alignment: Alignment.center,
                                    child: Image.asset(
                                      'assets/images/cerahberawan.png',
                                      width: 130,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                  ),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '${weather.temperature}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 90,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(width: 4),
                                      // RichText(
                                      //     text: const TextSpan(
                                      //   text: '°',
                                      //   style: TextStyle(
                                      //     color: Colors.white,
                                      //     fontSize: 20, // Ukuran simbol derajat
                                      //     fontFamily: 'Inter',
                                      //     fontWeight: FontWeight.w500,
                                      //   ),
                                      //   children: [
                                      //     TextSpan(
                                      //       text: 'C',
                                      //       style: TextStyle(
                                      //         fontSize: 14, // Ukuran huruf 'C'
                                      //       ),
                                      //     ),
                                      //   ],
                                      // )),
                                    ],
                                  ),

                                  Text(weather.iconPhrase,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      )
                                    ),

                                  SizedBox(height: 25),

                                  GlobalButtonn(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => WeatherForecastScreen())
                                      );
                                    },
                                    buttonColor: Colors.white,
                                    buttonText: 'Lihat Selengkapnya',
                                    buttonTextColor: GlobalColors.mainColor,
                                    fontSize: 14,
                                    buttonHeight: 50,
                                  ),
                                  const SizedBox(height: 16),
                                ],
                              ),
                            );
                          }
                        },
                      ),
                    const SizedBox(height: 16),

                    // Volume Penjualan Tanaman
                    SfCartesianChart(
                        primaryXAxis: const CategoryAxis(),
                        // Chart title
                        title: const ChartTitle(
                            text: 
                            'Volume Penjualan Tanaman',
                            textStyle: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),
                          ),
                        // Enable legend
                        legend: const Legend(isVisible: true),
                        // Enable tooltip
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <CartesianSeries<_SalesData, String>>[
                          BarSeries<_SalesData, String>(
                              dataSource: data,
                              xValueMapper: (_SalesData sales, _) => sales.year,
                              yValueMapper: (_SalesData sales, _) =>
                                  sales.sales,
                              name: 'Volume Penjualan',
                              color: GlobalColors.mainColor,
                              // Enable data label
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true))
                        ]),
                    const SizedBox(height: 10),
                    PenjualanTertinggi(),

                    const SizedBox(height: 26)
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}

Future<WeatherModel> _getWeatherFromUrl(String url) async {
    final body = jsonEncode({
        "locationkey": "3454195", 
    });
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      var decoded = json.decode(response.body)["data"][0];
      return WeatherModel.fromJson(decoded);
    } else {
      throw Exception();
    }
}