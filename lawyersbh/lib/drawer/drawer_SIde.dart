// ignore_for_file: deprecated_member_use, missing_return

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lawyers_bh/language/language_class.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../config.dart';
import 'header_widget.dart';

class DrawerSide extends StatefulWidget {
  const DrawerSide({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DrawerSideState createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  final Language _language = Language();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: scaffoldBackgroundColor,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            const SizedBox(
              height: 250,
              child: HeaderWidget(250, true,
                  Icons.balance), //let's create a common header widget
            ),
            const SizedBox(
              height: 8,
            ),
             Text(
              _language.tcallus(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  fontFamily: "Amiri",
                  color: Colors.black),
              textAlign: TextAlign.start,
            ),
            Padding(
              padding: const EdgeInsets.all(5),
              child: SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 250,
                          child: ElevatedButton.icon(
                              onPressed: () async {
                                String telurl = 'tel:+97339695009';
                                if (await canLaunchUrlString(telurl)) {
                                  launchUrlString(telurl);
                                } else {}
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  )),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.blueGrey)),
                              icon: const Icon(Icons.call),
                              label: const Text('+97339695009')),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 250,
                          child: ElevatedButton.icon(
                              onPressed: () async {
                                const url =
                                    "whatsapp://send?phone=+97339695009";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  )),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.green)),
                              icon: const Icon(Icons.whatshot),
                              label: const Text('+97339695009')),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 250,
                          child: ElevatedButton.icon(
                              onPressed: () async {
                                String subject = 'Sending a Mail';
                                String body = "Successfull";
                                String emailurl =
                                    'mailto:info@lawyers.bh?subject=$subject&body=$body';
                                if (await canLaunchUrlString(emailurl)) {
                                  launchUrlString(emailurl);
                                } else {}
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  )),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.red)),
                              icon: const Icon(Icons.forward_to_inbox),
                              label: const Text('info@lawyers.bh')),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: 250,
                          child: ElevatedButton.icon(
                              onPressed: () async {
                                const url =
                                    "https://www.instagram.com/lawyers.bh/?igshid=Yzg5MTU1MDY%3D";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18),
                                  )),
                                  backgroundColor:
                                      const MaterialStatePropertyAll(
                                          Colors.pink)),
                              icon: const Icon(FontAwesomeIcons.instagram),
                              label: const Text('lawyers.bh')),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                height: 155, width: 170, child: Image.asset("assets/2.png")),
          ],
        ),
      ),
    );
  }
}
