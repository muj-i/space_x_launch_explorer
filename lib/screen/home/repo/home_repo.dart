import 'dart:convert';
import 'dart:developer';

import 'package:space_x_launch_explorer/core/network/api_urls.dart';
import 'package:space_x_launch_explorer/core/network/network_caller.dart';
import 'package:space_x_launch_explorer/screen/home/model/launch_data_res.dart';

class HomeRepo {
  static Future<List<LaunchesResModel>> getLaunches() async {
    try {
      final res = await NetworkCaller.getRequest(ApiUrls.launches);
      if (res.isSuccess) {
        log('ReGET request successful: ${res.statusCode}');
        log('reResponse body: ${res.body}');
        return launchesResModelFromJson(jsonEncode(res.body));
      } else {
        return [];
      }
    } catch (e) {
      log("Error parsing launches: $e");
      return [];
    }
  }
  
}
