import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:kalender_pertanian_ta/model/salesmodel.dart';

class SalesService {

  final String salesURL = 'https://agricalbackend-production.up.railway.app/highest-volume-plant-latest-month';

  Future<SalesModel>  getSales() async {
    // Initialized Time and Pref Variables
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? lastFetchTime = prefs.getInt('lastFetchTime');
    int currentTime = DateTime.now().millisecondsSinceEpoch;

    // Fetching from Cloud
    if (lastFetchTime == null || (currentTime - lastFetchTime) > 360000/2){
      final res = await http.get(Uri.parse(salesURL));

      if (res.statusCode == 200) {
        var resBody = json.decode(res.body);
        await prefs.setInt('lastFetchTime', currentTime); // Update Fetch Data
        await prefs.setString('salesData', json.encode(resBody));
        return SalesModel.fromJson(resBody);
      } else {
        throw Exception();
      }
    }
    else {
      // Fetching Internally
      String? salesData = prefs.getString('salesData');
      if (salesData != null)  {
        var resBody = json.decode(salesData);
        return SalesModel.fromJson(resBody);
      } else {
        throw Exception();
      }
    }
  }
}