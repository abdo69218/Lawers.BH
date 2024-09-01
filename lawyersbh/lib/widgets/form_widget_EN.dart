// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Api_Server/Submit_Order.dart';
import '../Models/Submit_order_Model.dart';
import '../config.dart';

class BuildFormSpecialEN extends StatefulWidget {
  final String service_id;
  final String Name_service;


  const BuildFormSpecialEN({
    Key key,
    this.service_id,
    this.Name_service,
  }) : super(key: key);

  @override
  State<BuildFormSpecialEN> createState() => _BuildFormSpecialENState();
}

class _BuildFormSpecialENState extends State<BuildFormSpecialEN> {
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
                  textDirection: TextDirection.ltr,
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
                textDirection: TextDirection.ltr,
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
                              ? "Please enter a valid name"
                              : null,
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                            hintText: "Name",
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
                              ? "Please enter a valid phone number"
                              : null,
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                            hintText: "Phone No",
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
                              return 'Please enter a valid email';
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
                            hintText: "Email",
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
                              ? "This field is required"
                              : null,
                          decoration: InputDecoration(
                            errorStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            fillColor: Colors.grey[100],
                            filled: true,
                            hintText: "Enter the description message",
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
                              "Terms and Conditions",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                        Directionality(
                            textDirection: TextDirection.ltr,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Acknowledgment of the validity of the data: I declare that all the data entered are correct and under my responsibility, and I also declare that I agree with",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 15.3),
                                  textAlign: TextAlign.start,
                                ),
                                Text(
                                  "Terms and Conditions,and privacy policy for use",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: textColor),
                                  textAlign: TextAlign.start,
                                ),

                                Text(
                                  "Bahrain Lawyers platform (LAWYERS.bh) and I will be responsible if it is proven otherwise.",
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
                                        msg: "Sent succesfully",
                                      );
                                      Navigator.pop(context);
                                    });
                                  });
                                }else{
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  Fluttertoast.showToast(
                                    msg: "Fail",
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
                              "Send",
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
