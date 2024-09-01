import 'package:flutter/material.dart';
import 'package:lawyers_bh/widgets/form_widget_EN.dart';
import '../config.dart';
import '../language/language_class.dart';
import '../widgets/special_form.dart';

class SingleTips2 extends StatefulWidget {
  final String title;
  final String image2;
  final String serviceid;

  const SingleTips2({
    Key key,
    this.title,
    this.image2,
    this.serviceid,
  }) : super(key: key);

  @override
  State<SingleTips2> createState() => _SingleTips2State();
}

class _SingleTips2State extends State<SingleTips2> {
  Future _form(context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (context) => BuildFormSpecial(
        service_id: widget.serviceid,
        Name_service: widget.title,
      ),
    );
  }
  Future _formEN(context) {
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      isScrollControlled: true,
      context: context,
      builder: (context) => BuildFormSpecialEN(
        service_id: widget.serviceid,
        Name_service: widget.title,
      ),
    );
  }
  final Language _language = Language();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: 1,color: Colors.white),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0.2,
            blurRadius: 3,
            offset: const Offset(4, 4), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 50, width: 50, child: Image.asset(widget.image2)),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: "Amiri",
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MaterialButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        30,
                      ),
                    ),
                    onPressed: () {
                      Future.delayed(const Duration(microseconds: 100), () {
                        if (_language.getlanguage() == 'العربية'){
                          return _form(context);
                        }else{
                          return _formEN(context);
                        }
                      });
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: _language.Servicerequest()
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
