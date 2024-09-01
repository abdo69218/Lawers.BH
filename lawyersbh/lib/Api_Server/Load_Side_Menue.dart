import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/Load_Side_Menue_Model.dart';
class FetchApiSideMenue{
  Future<List<Load_Side_Menue_Model>> fetchsidemenue() async{
    List<Load_Side_Menue_Model> category = [];

    http.Response response = await http.post('https://lawyers.bh/mobile_app/mobile_app_api/load_side_menu.php');
    if (response.statusCode == 200 || response.statusCode == 400) {
      var body = jsonDecode(response.body);

      for (var item in body ){
        category.add(Load_Side_Menue_Model.fromJson(item));
      }
      return category;

    }

    return null;
  }

}