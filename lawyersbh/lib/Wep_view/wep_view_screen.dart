// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:lawyers_bh/language/language_class.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WepView extends StatefulWidget {
  final String service_id;
  final String Name_service;
  const WepView({Key key, this.service_id, this.Name_service})
      : super(key: key);

  @override
  State<WepView> createState() => _WepViewState();
}

class _WepViewState extends State<WepView> {
  form(context) {
    if (_language.getlanguage() == 'العربية') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.Name_service,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "Amiri",
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.start,
            textDirection: TextDirection.rtl,
          ),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.blueGrey,
                size: 25,
              )),
        ],
      );
    }
    if (_language.getlanguage() == 'English') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close,
                color: Colors.blueGrey,
                size: 25,
              )),
          Text(
            widget.Name_service,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontFamily: "Amiri",
              color: Colors.blueGrey,
            ),
            textAlign: TextAlign.start,
            textDirection: TextDirection.ltr,
          ),
        ],
      );
    }
  }

  Language _language = Language();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: form(context),
                  )),
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 400,
                child: WebView(
                  initialUrl:
                      '',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {


                    widget.service_id;
                    widget.Name_service;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
