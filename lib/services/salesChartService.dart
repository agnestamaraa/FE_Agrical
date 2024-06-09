import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalender_pertanian_ta/model/saleschartmodel.dart';

class SalesChartService {

  final String SalesChartURL = 'https://agricalbackend-production.up.railway.app/plant-volume-latest-month';

  Future<SalesChartList>  getSalesChart() async {

    final res = await http.get(Uri.parse(SalesChartURL));

    if (res.statusCode == 200) {
      var resBody = json.decode(res.body);
      return SalesChartList.fromJson(resBody);
    } else {
      throw Exception();
    }
  } 
}