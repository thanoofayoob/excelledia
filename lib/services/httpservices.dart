// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;

class HttpService {
  int timeout = 15;

  Map<String, String> headerss = {'Content-Type': 'application/json'};

  var client = http.Client();
  Future<http.Response?> getApi({required String url}) async {
    var response = await client
        .get(Uri.parse(url), headers: headerss)
        .timeout(Duration(seconds: timeout));
    // print(headers);
    print(url);

    if (response.statusCode < 200 || response.statusCode > 226) {
      // if (response.statusCode == 401) {
      //   // await Get.find<UserDataController>().refreshToken();
      // }
      // apiLoader(false);
      print(response.body);
    } else {
      //  apiLoader(false);
      //loadRetry = true;
      print(response.body);
      return response;
    }
  }

  Future<http.Response?> getApiwithHeader(
      {required String? url, required String? access}) async {
    // bool loadRetry = false;
    Map<String, String> headers = {
      'Authorization': 'Bearer $access',
      'Content-Type': 'application/json'
    };

    // apiLoader(true);
    var response = await client
        .get(Uri.parse(url!), headers: headers)
        .timeout(Duration(seconds: timeout));

    if (response.statusCode < 200 || response.statusCode > 226) {
    } else {
      return response;
    }
  }

  Future<http.Response?> postApiwithHeader(
      {required String? url, required String? access}) async {
    // bool loadRetry = false;
    Map<String, String> headers = {
      'Authorization': 'Bearer $access',
      'Content-Type': 'application/json'
    };

    // apiLoader(true);
    var response = await client
        .post(Uri.parse(url!), headers: headers)
        .timeout(Duration(seconds: timeout));

    if (response.statusCode < 200 || response.statusCode > 226) {
    } else {
      return response;
    }
  }
}
