import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kalender_pertanian_ta/model/salesmodel.dart';

class SalesService {

  final String salesURL = 'https://agricalbackend-production.up.railway.app/highest-volume-plant-latest-month';

  Future<SalesModel>  getSales() async {

    final res = await http.get(Uri.parse(salesURL));

    if (res.statusCode == 200) {
      var resBody = json.decode(res.body);
      return SalesModel.fromJson(resBody);
    } else {
      throw Exception();
    }
  }
}