// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lawyers_bh/language/language_class.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'Api_Server/Load_Service.dart';
import 'Api_Server/Load_Side_Menue.dart';
import 'Models/Load_Side_Menue_Model.dart';
import 'Models/Service_Model.dart';
import 'Search/screen.dart';
import 'config.dart';
import 'drawer/header_widget.dart';
import 'home_companant/SingleTips2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FetchApiSideMenue fetchApi = FetchApiSideMenue();
  FetchApiService fetchApiService = FetchApiService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FetchApiSideMenue();
    FetchApiService();
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
          title: ListTile(
              trailing: CircleAvatar(
                radius: 18,
                backgroundColor: primaryColor,
                child: IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: SearchUser());
                  },
                  icon: const Icon(
                    FontAwesomeIcons.search,
                    size: 13,
                    color: Colors.white,
                  ),
                ),
              ),
              title: Text(
                _language.thome(),
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                    fontFamily: "Amiri",
                    color: Colors.black),
                textAlign: TextAlign.start,
              ))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
            future: fetchApi.fetchsidemenue(),
            builder: (context, snapchot) {
              if (snapchot.data == null) {
                return Container();
              }
              List<Load_Side_Menue_Model> side = snapchot.data;
              _seleclang(index) {
                if (_language.getlanguage() == 'العربية') {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.network(side[index].imagePath)),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            side[index].arName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: "Amiri",
                                color: primaryColor,
                                fontSize: 17),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.ltr,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (_language.getlanguage() == 'English') {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            side[index].enName,
                            style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                color: primaryColor,
                                fontFamily: "Amiri",
                                fontSize: 17),
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.ltr,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                              height: 30,
                              width: 30,
                              child: Image.network(side[index].imagePath)),
                        ],
                      ),
                    ),
                  );
                }
              }

              _seleclang2(index) {
                if (_language.getlanguage() == 'العربية') {
                  return SizedBox(
                      child: Text(
                    side[index].arDesc,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Amiri",
                        fontSize: 18,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                  ));
                }
                if (_language.getlanguage() == 'English') {
                  return SizedBox(
                      child: Text(
                    side[index].enDesc,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: "Amiri",
                        fontSize: 18,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                  ));
                }
              }

              return ListView.builder(
                itemCount: side.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _seleclang(index),
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
                                width: 300,
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
                      _seleclang2(index),
                      FutureBuilder(
                          future: fetchApiService.fetchservice(side[index].id),
                          builder: (context, snapchot) {
                            if (snapchot.data == null) {
                              return const CircularProgressIndicator(
                                backgroundColor: primaryColor,
                                color: Colors.white,
                                strokeWidth: 2,
                              );
                            }
                            List<Service_Model> side2 = snapchot.data;
                            _selectlang3(index) {
                              if (_language.getlanguage() == 'العربية') {
                                return side2[index].arName;
                              }
                              if (_language.getlanguage() == 'English') {
                                return side2[index].enName;
                              }
                            }

                            return Padding(
                              padding: const EdgeInsets.all(5),
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: side2.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 5,
                                  childAspectRatio: 0.8,
                                ),
                                itemBuilder: (
                                  ctx,
                                  index,
                                ) {
                                  return SingleTips2(
                                    title: _selectlang3(index),
                                    image2: side2[index].imagePath,
                                    serviceid: side2[index].id,
                                  );
                                },
                              ),
                            );
                          }),
                    ],
                  );
                },
              );
            }),
      ),
    );
  }
}
