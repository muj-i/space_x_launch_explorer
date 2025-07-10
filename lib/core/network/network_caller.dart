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
        return NetworkResponse(isSuccess: true, statusCode: response.statusCode, responseData: decoded);
      } else {
        return NetworkResponse(isSuccess: false, statusCode: response.statusCode, responseData: []);
      }
    } catch (e) {
      log('Error occurred during GET request: $e');
      return const NetworkResponse(isSuccess: false, statusCode: -1, responseData: []);
    }
  }
}
