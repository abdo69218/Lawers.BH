import 'package:url_launcher/url_launcher_string.dart';
import 'package:flutter/material.dart';

class Urllauncher extends StatefulWidget {
  const Urllauncher({Key key, }) : super(key: key);

  @override
  State<Urllauncher> createState() => _UrllauncherState();
}

class _UrllauncherState extends State<Urllauncher> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient:
                LinearGradient(colors: [Colors.deepPurple, Colors.red]))),
        title: const Text('URL Launcher App'),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton.icon(
                  onPressed: () async {
                    // final websiteurl = Uri.parse('https://flutter.dev/');
                    String websitelink = 'https://flutter.dev/';
                    if (await canLaunchUrlString(websitelink)) {
                      launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                    } else {
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.pink)),
                  icon: const Icon(Icons.rocket_launch),
                  label: const Text('Launch URL')),
              ElevatedButton.icon(
                  onPressed: () async {
                    String smsurl = 'sms:123456789?body=Hlo';
                    if (await canLaunchUrlString(smsurl)) {
                      launchUrlString(smsurl);
                    } else {
                    }
                  },
                  style: ButtonStyle(
                      backgroundColor:
                      MaterialStatePropertyAll(Colors.blueGrey[800])),
                  icon: const Icon(Icons.sms),
                  label: const Text('Make SMS')),
              ElevatedButton.icon(
                  onPressed: () async {
                    String telurl = 'tel:123456789';
                    if (await canLaunchUrlString(telurl)) {
                      launchUrlString(telurl);
                    } else {
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.teal)),
                  icon: const Icon(Icons.call),
                  label: const Text('Make CALL')),
              ElevatedButton.icon(
                  onPressed: () async {
                    String subject = 'Sending a Mail';
                    String body = "Successfull";
                    String emailurl =
                        'mailto:example@gmail.com?subject=$subject&body=$body';
                    if (await canLaunchUrlString(emailurl)) {
                      launchUrlString(emailurl);
                    } else {
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  icon: const Icon(Icons.forward_to_inbox),
                  label: const Text('Send MAIL')),
              ElevatedButton.icon(
                  onPressed: () async {
                    String latitude = '42.3540';
                    String longitude = '71.0586';
                    String geourl = 'geo:$latitude,$longitude';
                    if (await canLaunchUrlString(geourl)) {
                      launchUrlString(geourl);
                    } else {
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue)),
                  icon: const Icon(Icons.near_me),
                  label: const Text('LOCATION')),
            ],
          )),
    );
  }
}