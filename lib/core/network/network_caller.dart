import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:space_x_launch_explorer/core/network/network_response.dart';

class NetworkCaller {
  static Future<NetworkResponse> getRequest(String url) async {
    try {
      Response response = await get(Uri.parse(url));
      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body); 
        log('GET request successful: ${response.statusCode}');
        log('Response body: $decoded');
        return NetworkResponse(true, response.statusCode, decoded);
      } else {
        return NetworkResponse(false, response.statusCode, []);
      }
    } catch (e) {
      log('Error occurred during GET request: $e');
      return const NetworkResponse(false, -1, []);
    }
  }
}
