// ignore_for_file: non_constant_identifier_names

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/Submit_order_Model.dart';

class APISignup {
  Create_New_Account(
      Create_Account_Request_model requestModel) async {
    String url =
        "https://lawyers.bh/mobile_app/submit_order.php";
    print(requestModel.toJson());
    final response =
        await http.post(url, body: json.encode(requestModel.toJson()));
    if (response.statusCode == 200 || response.statusCode == 400) {
      print(json.decode(response.body));
    } else {

    }
  }
}
