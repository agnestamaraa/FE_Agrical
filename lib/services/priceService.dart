import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:kalender_pertanian_ta/model/pricemodel.dart';

class PriceService {

  final String priceURL = 'https://agricalbackend-production.up.railway.app/highest-harga-jual-plant-latest-month';
  
  Future<PriceModel>  getPrice() async {
    // Initialized Time and Pref Variables
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? lastFetchTime = prefs.getInt('lastFetchTime');
    int currentTime = DateTime.now().millisecondsSinceEpoch;

    if (lastFetchTime == null || (currentTime - lastFetchTime) > 360000/2){

      final res = await http.get(Uri.parse(priceURL));

      if (res.statusCode == 200) {
        var resBody = json.decode(res.body);
        await prefs.setInt('lastFetchTime', currentTime); // Update Fetch Data
        await prefs.setString('priceData', json.encode(resBody));
        return PriceModel.fromJson(resBody);
      } else {
        throw Exception();
      }
    }
    else {
      // Fetching Internally
      String? priceData = prefs.getString('priceData');
      if (priceData != null){
        var resBody = json.decode(priceData);
        return PriceModel.fromJson(resBody);
      } else{
        throw Exception();
      }
    }
  }
}