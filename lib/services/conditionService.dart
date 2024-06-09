import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kalender_pertanian_ta/model/conditionmodel.dart';

class ConditionService {

  final String conditionURL = 'https://agricalbackend-production.up.railway.app/latestkondisilahan';

  Future<ConditionModel>  getCondition() async {

    final res = await http.get(Uri.parse(conditionURL));

    if (res.statusCode == 200) {
      var resBody = json.decode(res.body);
      return ConditionModel.fromJson(resBody);
    } else {
      throw Exception();
    }
  }
}