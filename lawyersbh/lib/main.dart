import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Get_Start/Start_page.dart';
String language = 'العربية';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((instance) => {
    language = instance.getString("language")
  });
  runApp(MyApp());}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return   const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
