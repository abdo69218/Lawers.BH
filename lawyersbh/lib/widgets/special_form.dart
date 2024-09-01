// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Api_Server/Submit_Order.dart';
import '../Models/Submit_order_Model.dart';
import '../config.dart';

class BuildFormSpecial extends StatefulWidget {
  final String service_id;
  final String Name_service;


  const BuildFormSpecial({
    Key key,
    this.service_id,
    this.Name_service,
  }) : super(key: key);

  @override
  State<BuildFormSpecial> createState() => _BuildFormSpecialState();
}

class _BuildFormSpecialState extends State<BuildFormSpecial> {
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        decoration: const BoxDecoration(color: primaryColor),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 5,
              ),
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.Name_service,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                            )),
                      ],
                    ),
                  )),
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
                          validator: (input) =>
                              input.isEmpty || input.length < 2
                                  ? "الرجاء ادخال اسم صحيح"
                                  : null,
                          decoration: InputDecoration(
                              errorStyle: const TextStyle(color: Colors.black),
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
                          validator: (input) =>
                              input.isEmpty || input.length < 11
                                  ? "الرجاء ادخال رقم هاتف صحيح"
                                  : null,
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(color: Colors.black),
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
                            errorStyle: const TextStyle(color: Colors.black),
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
                          validator: (input) =>
                              input.isEmpty || input.length < 2
                                  ? "هذا الحقل مطلوب"
                                  : null,
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(color: Colors.black),
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
                              onChanged: (bool abdo) {
                                setState(() {
                                  isChecked = abdo;
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
                              children: const [
                                Text(
                                  "اقرار بصحة البيانات : اقر بان جميع البيانات المدخلة صحيحة وتحت مسؤليتي, كما اقر باني موافق علي ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 15.3),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  "الشروط والاحكام , وسياسة الخصوصية الخاصة باستخدام",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
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

                             if(isChecked){
                               Future.delayed(const Duration(seconds: 1), () {
                                 setState(() {
                                   _isLoading = false;
                                 });
                                 setState(() {
                                   isApiCallProcess = true;
                                   creatRequestModel.service_id =
                                       widget.service_id;
                                 });
                                 APISignup apiService = APISignup();
                                 apiService.Create_New_Account(
                                     creatRequestModel)
                                     .then((value) {
                                   Fluttertoast.showToast(
                                     msg: "تم الارسال بنجاح",
                                   );
                                   Navigator.pop(context);
                                 });
                               });
                             }else{
                               setState(() {
                                 _isLoading = false;
                               });
                               Fluttertoast.showToast(
                                 msg: "فشل",
                               );
                             }
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
                        const SizedBox(
                          height: 25,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
