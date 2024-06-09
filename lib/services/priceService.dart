import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kalender_pertanian_ta/model/pricemodel.dart';

class PriceService {

  final String priceURL = 'https://agricalbackend-production.up.railway.app/highest-harga-jual-plant-latest-month';

  Future<PriceModel>  getPrice() async {

    final res = await http.get(Uri.parse(priceURL));

    if (res.statusCode == 200) {
      var resBody = json.decode(res.body);
      return PriceModel.fromJson(resBody);
    } else {
      throw Exception();
    }
  }
}