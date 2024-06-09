import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:kalender_pertanian_ta/model/conditionmodel.dart';

class ConditionService {
  final String conditionURL = 'https://agricalbackend-production.up.railway.app/latestkondisilahan';
  final int cacheDurationMillis = 180000; // 3 minutes in milliseconds

  Future<ConditionModel> getCondition() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      int? lastFetchTime = prefs.getInt('lastFetchTimeCondition'); // Specific key for ConditionService
      int currentTime = DateTime.now().millisecondsSinceEpoch;

      // Check if we need to fetch from the network
      if (lastFetchTime == null || (currentTime - lastFetchTime) > cacheDurationMillis) {
        return await _fetchFromNetworkAndCache(prefs, currentTime);
      } else {
        return _fetchFromCache(prefs);
      }
    } catch (e) {
      // Throw a descriptive exception in case of failure
      throw Exception('Failed to load condition data: $e');
    }
  }

  // Fetch data from the network and update the cache
  Future<ConditionModel> _fetchFromNetworkAndCache(SharedPreferences prefs, int currentTime) async {
    try {
      final res = await http.get(Uri.parse(conditionURL)).timeout(Duration(seconds: 10)); // Adding a timeout for the request

      if (res.statusCode == 200) {
        var resBody = json.decode(res.body);
        
        // Cache the fetched data and update the fetch time
        await prefs.setInt('lastFetchTimeCondition', currentTime);
        await prefs.setString('conditionData', json.encode(resBody));
        
        return ConditionModel.fromJson(resBody);
      } else {
        // Throw an exception with the HTTP status code if the request failed
        throw Exception('Failed to load data from network: HTTP ${res.statusCode}');
      }
    } catch (e) {
      // Handle network request failure with an exception message
      throw Exception('Network request failed: $e');
    }
  }

  // Fetch data from the cache
  ConditionModel _fetchFromCache(SharedPreferences prefs) {
    String? conditionData = prefs.getString('conditionData');

    if (conditionData != null) {
      var resBody = json.decode(conditionData);
      return ConditionModel.fromJson(resBody);
    } else {
      // Throw an exception if no cached data is found
      throw Exception('No cached condition data found.');
    }
  }
}


// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:kalender_pertanian_ta/model/conditionmodel.dart';

// class ConditionService {

//   final String conditionURL = 'https://agricalbackend-production.up.railway.app/latestkondisilahan';

//   Future<ConditionModel>  getCondition() async {

//     final res = await http.get(Uri.parse(conditionURL));

//     if (res.statusCode == 200) {
//       var resBody = json.decode(res.body);
//       return ConditionModel.fromJson(resBody);
//     } else {
//       throw Exception();
//     }
//   }
// }