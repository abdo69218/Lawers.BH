// ignore_for_file: deprecated_member_use, override_on_non_overriding_member


import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../Api_Server/Submit_Order.dart';
import '../Models/Submit_order_Model.dart';
import '../config.dart';
import '../home_companant/page_view.dart';


class BuildForm extends StatefulWidget {
  const BuildForm({
    Key key,
  }) : super(key: key);

  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  bool validateAndSave() {
    final form = globalFormKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Create_Account_Request_model creatRequestModel;
  @override
  void initState() {
    super.initState();
    creatRequestModel = Create_Account_Request_model();
  }

  bool isApiCallProcess = false;

  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.black;
    }
    return Colors.white;
  }
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.7),
          spreadRadius: 2,
          blurRadius: 5,
          offset: const Offset(4, 4), // changes position of shadow
        ),
      ], color: primaryColor, borderRadius: BorderRadius.circular(30)),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              "خدمات العملاء والمقترحات والشكاوي",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 20),
              textAlign: TextAlign.start,
            ),
            const SizedBox(
              height: 20,
            ),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Form(
                key: globalFormKey,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (input) => creatRequestModel.name = input,
                        validator: (input) => input.isEmpty || input.length < 2
                            ? "الرجاء ادخال اسم صحيح"
                            : null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey[100],
                          filled: true,
                          hintText: "الاسم",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(),
                        onSaved: (input) => creatRequestModel.mobile = input,
                        validator: (input) => input.isEmpty
                            ? "الرجاء ادخال رقم هاتف صحيح"
                            : null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey[100],
                          filled: true,
                          hintText: "رقم الهاتف",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (input) => creatRequestModel.email = input,
                        validator: (input) {
                          if (input.isEmpty || !input.contains('@') || !input.contains('.com')) {
                            return 'الرجاء ادخال ايميل صحيح';
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey[100],
                          filled: true,
                          hintText: "الايميل",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 10),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        onSaved: (input) => creatRequestModel.comment = input,
                        validator: (input) => input.isEmpty || input.length < 2
                            ? "هذا الحقل مطلوب"
                            : null,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          fillColor: Colors.grey[100],
                          filled: true,
                          hintText: " ادخل رسالة الوصف",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 10),
                        ),
                      ),
                      Row(
                        children: [
                          Checkbox(
                            checkColor: primaryColor,
                            fillColor:
                                MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (bool value) {
                              setState(() {
                                isChecked = value;
                              });
                            },
                          ),
                          const Text(
                            "الشروط والاحكام",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 15),
                            textAlign: TextAlign.start,
                          )
                        ],
                      ),
                      Directionality(
                          textDirection: TextDirection.rtl,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "اقرار بصحة البيانات : اقر بان جميع البيانات المدخلة صحيحة وتحت مسؤليتي, كما اقر باني موافق علي ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 15.3),
                                textAlign: TextAlign.start,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    GestureDetector(
                                      child: const Text(
                                        "الشروط والاحكام",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: textColor),
                                        textAlign: TextAlign.start,
                                      ),
                                      onTap: () {

                                      },
                                    ),
                                    const SizedBox(
                                      width: 3,
                                    ),
                                    const Text(
                                      "وسياسة الخصوصية الخاصة باستخدام",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          fontSize: 15.3),
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                              ),
                              const Text(
                                "منصة محامون البحرين (LAWYERS.bh) واكون مسؤل اذا ثبت خلاف ما ورد.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 15.3),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 30,
                        child: MaterialButton(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                          onPressed: () {
                            if (validateAndSave()) {
                              setState(() {
                                _isLoading = true;
                              });

                              Future.delayed(const Duration(seconds: 2), () {
                                setState(() {
                                  _isLoading = false;
                                });
                                setState(() {
                                  isApiCallProcess = true;
                                  creatRequestModel.service_id =
                                      "الشكاوي وخدمة العملاء";
                                });
                                APISignup apiService = APISignup();
                                apiService.Create_New_Account(
                                    creatRequestModel)
                                    .then((value) {
                                  Fluttertoast.showToast(
                                    msg: "تم الارسال بنجاح",
                                  );
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const HomePage()));
                                });
                              });
                            }
                          },
                          child: _isLoading
                              ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              backgroundColor: Colors.white,
                              color: Colors.black,
                              strokeWidth: 2,
                            ),
                          )
                              : const Text(
                            "ارسال",
                            style: TextStyle(color: primaryColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "تواصل معنا ...",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
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
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color(0xffE8E2E2))),
                        icon: const Icon(
                          Icons.call,
                          color: Colors.blueGrey,
                        ),
                        label: const Text(
                          '+97339695009',
                          style: TextStyle(color: Colors.black),
                        )),
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
                          const url = "whatsapp://send?phone=+97339695009";
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color(0xffE8E2E2))),
                        icon: const Icon(
                          Icons.whatshot,
                          color: Colors.green,
                        ),
                        label: const Text(
                          '+97339695009',
                          style: TextStyle(color: Colors.black),
                        )),
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
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color(0xffE8E2E2))),
                        icon: const Icon(
                          Icons.forward_to_inbox,
                          color: Colors.red,
                        ),
                        label: const Text(
                          'info@lawyers.bh',
                          style: TextStyle(color: Colors.black),
                        )),
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
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                            )),
                            backgroundColor: const MaterialStatePropertyAll(
                                Color(0xffE8E2E2))),
                        icon: const Icon(
                          FontAwesomeIcons.instagram,
                          color: Colors.pink,
                        ),
                        label: const Text(
                          'lawyers.bh',
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
