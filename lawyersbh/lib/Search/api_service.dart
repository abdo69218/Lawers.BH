import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/Service_Model.dart';

class FetchUserList {
  var data = [];
  List<Service_Model> results = [];
  String urlList =
      'https://lawyers.bh/mobile_app/mobile_app_api/find_services.php';

  Future<List<Service_Model>> getserviceList({String query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => Service_Model.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) =>
                  element.arName.toLowerCase().contains((query.toLowerCase())))
              .toList();
          results = results
              .where((element) =>
                  element.enName.toLowerCase().contains((query.toLowerCase())))
              .toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}
