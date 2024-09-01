import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config.dart';
import '../home_companant/page_view.dart';
import '../language/language_class.dart';
import '../main.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final List<String> _languages = ['العربية', 'English'];
  String _selectedLanguage;

  final Language _language = Language();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _language.getlanguage();
    });
    _selectlang();
  }

  welcome3() {
    if (_language.getlanguage() == 'العربية') {
      return FittedBox(
        child: GestureDetector(
          onTap: () {
            if (_selectedLanguage != null) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ));
            } else {
              Fluttertoast.showToast(
                msg: _language.ttoast(),
              );
            }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 25),
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: primaryColor),
            child: Row(
              children: <Widget>[
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
                const SizedBox(width: 10),
                Text(
                  "البدا",
                  style: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.white,
                        fontFamily: "Amiri",
                      ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    if (_language.getlanguage() == 'English') {
      return FittedBox(
        child: GestureDetector(
          onTap: () {
            if (_selectedLanguage != null) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ));
            } else {
              Fluttertoast.showToast(
                msg: _language.ttoast(),
              );
            }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 25),
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: primaryColor),
            child: Row(
              children: <Widget>[
                Text(
                  "Start",
                  style: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.white,
                        fontFamily: "Amiri",
                      ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      );
    }
    if (_language.getlanguage() == null) {
      return FittedBox(
        child: GestureDetector(
          onTap: () {
            if (_selectedLanguage != null) {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ));
            } else {
              Fluttertoast.showToast(
                msg: _language.ttoast(),
              );
            }
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 25),
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25), color: primaryColor),
            child: Row(
              children: <Widget>[
                Text(
                  "البدا",
                  style: Theme.of(context).textTheme.button.copyWith(
                        color: Colors.white,
                        fontFamily: "Amiri",
                      ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/15.png"),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                RichText(
                  textAlign: TextAlign.center,
                  text:  TextSpan(
                    children: [
                      TextSpan(
                          text: "${_language.welcome()}\n",
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Amiri",
                              fontSize: 18)),
                      TextSpan(
                          text: _language.welcome2(),
                          style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "Amiri",
                              fontSize: 18)),
                    ],
                  ),
                ),
                DropdownButton(
                  underline: const SizedBox(),
                  borderRadius: BorderRadius.circular(10),
                  icon: const Icon(Icons.language),
                  value: _selectedLanguage,
                  onChanged: (newvalue) async {
                    setState(() {
                      _selectedLanguage = newvalue;
                    });
                    SharedPreferences pref =
                        await SharedPreferences.getInstance();
                    pref.setString("language", newvalue);
                    _language.setlanguage(newvalue);
                    language = newvalue;
                  },
                  items: _languages.map((lang) {
                    return DropdownMenuItem(
                      value: lang,
                      child: Text(
                        lang,
                        style: const TextStyle(
                          fontFamily: "Amiri",
                        ),
                      ),
                    );
                  }).toList(),
                ),
                welcome3(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _selectlang() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = pref.getString("language");
    });
  }
}
