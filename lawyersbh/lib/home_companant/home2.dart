// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lawyers_bh/language/language_class.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../config.dart';
import '../drawer/header_widget.dart';

class Home2 extends StatefulWidget {
  const Home2({Key key}) : super(key: key);

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
  final LatLng _initialcameraposition = const LatLng(26.13769, 50.56634);
  GoogleMapController controller;

  void _onMapCreated(GoogleMapController value) {
    controller = value;
    {
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          const CameraPosition(
              target: LatLng(
                26.13769,
                50.56634,
              ),
              zoom: 18),
        ),
      );
    }
  }
final Language _language = Language();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      drawer: Drawer(
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
                  height: 155, width: 170, child: Image.asset("assets/13.png")),
            ],
          ),
        ),
      ),
      appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return MaterialButton(
                child: Image.asset("assets/16.png"),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },

              );
            },
          ),
        centerTitle: true,
        shadowColor: Colors.grey,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15))),
        backgroundColor: scaffoldBackgroundColor,
        iconTheme: const IconThemeData(color: primaryColor),
        title:  Text(
          _language.tabout(),
          style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              fontFamily: "Amiri",
              color: Colors.black),
          textAlign: TextAlign.start,
        )
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
             Text(
             _language.map(),
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "Amiri",
                  color: primaryColor,
                  fontSize: 20),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 7,
                  ),
                  Container(
                      width: 150,
                      height: 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.black)),
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 7,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.7),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(4, 4), // changes position of shadow
                ),
              ], borderRadius: BorderRadius.circular(30), color: primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 85,
                    decoration: BoxDecoration(
                        border: Border.all(width: 2, color: Colors.white),
                        borderRadius: BorderRadius.circular(10)),
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(10),
                    child: const Text(
                      "Reem Centre, 113 office, Building 13,Road 2923, Block 923 Al, East Riffa, البحرين",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500,  fontFamily: "Amiri",),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 50),
                    height: 30,
                    child: MaterialButton(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ),
                      ),
                      onPressed: () async {
                        String websitelink =
                            'https://www.google.com/maps/place/%D9%85%D9%83%D8%AA%D8%A8+%D8%A7%D9%84%D9%85%D8%AD%D8%A7%D9%85%D9%8A+%D8%B3%D8%B9%D8%AF+%D8%B9%D8%A8%D8%AF%D8%A7%D9%84%D9%84%D9%87+%D8%A7%D9%84%D8%B4%D9%85%D9%84%D8%A7%D9%86%E2%80%AD/@26.1377615,50.568727,17.28z/data=!4m6!3m5!1s0x3e49ada385cea22d:0x5afa8c5565d828a8!8m2!3d26.1377212!4d50.5663658!16s%2Fg%2F11rv1kgy08';
                        if (await canLaunchUrlString(websitelink)) {
                          launchUrlString(websitelink,
                              mode: LaunchMode.inAppWebView);
                        } else {}
                      },
                      child: _language.map2()
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    height: 350,
                    width: 300,
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: _initialcameraposition,
                      ),
                      mapType: MapType.normal,
                      onMapCreated: _onMapCreated,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 7,
                  ),
                  Container(
                      width: 200,
                      height: 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.black)),
                  const CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 7,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
                height: 100, width: 100, child: Image.asset("assets/2.png")),
            const SizedBox(
              height: 30,
            ),
             Text(
              _language.info(),
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontFamily: "Amiri",
                  color: Colors.black,
                  fontSize: 20),
            ),
            const SizedBox(
              height: 6,
            ),
            GestureDetector(
              onTap: () async {
                String websitelink =
                    'https://www.bahrain.bh/new/ar/lifeinbahrain_ar.html';
                if (await canLaunchUrlString(websitelink)) {
                  launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                } else {}
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: textColor,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child:  Text(
                  _language.info2(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Amiri",
                      color: textColor,
                      fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            GestureDetector(
              onTap: () async {
                String websitelink =
                    'https://www.bahrain.bh/new/ar/aboutkingdom_ar.html';
                if (await canLaunchUrlString(websitelink)) {
                  launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                } else {}
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: textColor,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child:  Text(
                  _language.info3(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Amiri",
                      color: textColor,
                      fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            GestureDetector(
              onTap: () async {
                String websitelink =
                    'https://services.bahrain.bh/wps/portal/!ut/p/a1/jZDNroJADEafxQVbWocBR3cD3gj4g8YQcTY3Q8IFbhDMiOLji-xMFOmuzTnp14KACEQpb3kq67wqZfHshfXL2MIZE0Z8Rn847jbbjTW2fYIUW-DYAiYjjrtsgcCgJnK63Nlh4BoY4DDfWXCXTlaISBlBb26788l0jehZw3z8UPzr_r1UcADRYX1XdEBfzA7oyeGDSIsq7n565GVssBSESv4SlSj9qtpxVtfny0xDDZum0WOZKZmXepxp-E7JqksN0SsJ51MYRnfv3yxuK85HowcdHZ5w/dl5/d5/L2dBISEvZ0FBIS9nQSEh/';
                if (await canLaunchUrlString(websitelink)) {
                  launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                } else {}
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: textColor,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child:  Text(
                  _language.info4(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Amiri",
                      color: textColor,
                      fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            GestureDetector(
              onTap: () async {
                String websitelink =
                    'https://www.bahrain.bh/new/ar/eparticipation_ar.html';
                if (await canLaunchUrlString(websitelink)) {
                  launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                } else {}
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: textColor,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child:  Text(
                  _language.info5(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Amiri",
                      color: textColor,
                      fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            GestureDetector(
              onTap: () async {
                String websitelink =
                    'https://www.bahrain.bh/wps/portal/!ut/p/a1/04_Sj9CPykssy0xPLMnMz0vMAfGjzOI9_A3MDI0sjLzc3YxdDBz9fI1dApxCjb39zYAKIpEVGBgbuxo4-puZB5iHWRqZWRgQp9_AyNfZ0NMEqN_X18DA0cIpyCfEzdnAwN2YSP04gCNB-4MTi_TD9aNQlWHxBVgBPmdCFOB2R0FuaGhEhWcmAGSnhy8!/dl5/d5/L2dBISEvZ0FBIS9nQSEh/';
                if (await canLaunchUrlString(websitelink)) {
                  launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                } else {}
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: textColor,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child:  Text(
                  _language.info6(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Amiri",
                      color: textColor,
                      fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
             Text(
              _language.info7(),
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: "Amiri",
                  fontSize: 20),
            ),
            const SizedBox(
              height: 6,
            ),
            GestureDetector(
              onTap: () async {
                String websitelink =
                    'https://lawyers.bh/wp-content/uploads/2022/12/%D9%85%D9%86-%D9%86%D8%AD%D9%86-%D9%84%D9%84%D9%85%D9%88%D9%82%D8%B9-27-%D9%86%D9%88%D9%81%D9%85%D8%A8%D8%B1-2022.pdf';
                if (await canLaunchUrlString(websitelink)) {
                  launchUrlString(websitelink, mode: LaunchMode.inAppWebView);
                } else {}
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: textColor,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child:  Text(
                  _language.info8(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Amiri",
                      color: textColor,
                      fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            GestureDetector(
              onTap: () async {
                const url = "whatsapp://send?phone=+97339695009";
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: textColor,
                    ),
                    borderRadius: BorderRadius.circular(5)),
                child:  Text(
                  _language.info9(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: "Amiri",
                      color: textColor,
                      fontSize: 15),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
    );
  }
}
