import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/Service_Model.dart';

class FetchApiService{

Future<List<Service_Model>> fetchservice(String categoryId) async{
    List<Service_Model> service = [];

    http.Response response = await  http.post(
      Uri.parse(''),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },

      body: jsonEncode(<String, String>{
        'category_id': categoryId,'service_name': "",
      }),
    );
    if (response.statusCode == 200 || response.statusCode == 400) {
      var body = jsonDecode(response.body);

      for (var item in body ){
        service.add(Service_Model.fromJson(item));
      }
      return service;


    }
    return null;
  }

}
