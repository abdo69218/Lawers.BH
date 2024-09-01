// ignore_for_file: non_constant_identifier_names, missing_return

import 'package:flutter/material.dart';
import 'package:lawyers_bh/main.dart';
import '../config.dart';

class Language extends ChangeNotifier {
  String _lang = language;

  getlanguage() {
    return _lang;
  }

  setlanguage(String lang) {
    _lang = lang;
    notifyListeners();
  }

  String tcallus() {
    if (getlanguage() == 'العربية') {
      return ': تواصل معنا ';
    }
    if (getlanguage() == 'English') {
      return 'Connect with us : ';
    }
  }

  String thome() {
    if (getlanguage() == 'العربية') {
      return 'الصفحة الرئيسية';
    }
    if (getlanguage() == 'English') {
      return 'Home page';
    }
  }
  String map() {
    if (getlanguage() == 'العربية') {
      return 'موقعنا';
    }
    if (getlanguage() == 'English') {
      return 'Location';
    }
  }
  String info() {
    if (getlanguage() == 'العربية') {
      return 'دليل المعلومات (خدمات المجتمع)';
    }
    if (getlanguage() == 'English') {
      return 'Information guide (community services)';
    }
  }
  String info2() {
    if (getlanguage() == 'العربية') {
      return 'حياتك في البحرين';
    }
    if (getlanguage() == 'English') {
      return 'Your life in Bahrain';
    }
  }
  String info3() {
    if (getlanguage() == 'العربية') {
      return 'عن المملكة';
    }
    if (getlanguage() == 'English') {
      return 'About the kingdom';
    }
  }
  String info4() {
    if (getlanguage() == 'العربية') {
      return 'دليل الخدمات الحكومية';
    }
    if (getlanguage() == 'English') {
      return 'Government Services Directory';
    }
  }
  String info5() {
    if (getlanguage() == 'العربية') {
      return 'المشاركة الالكترونية';
    }
    if (getlanguage() == 'English') {
      return 'Electronic participation';
    }
  }
  String info6() {
    if (getlanguage() == 'العربية') {
      return 'دليل الجهات الحكومية';
    }
    if (getlanguage() == 'English') {
      return 'Government agencies directory';
    }
  }
  String info7() {
    if (getlanguage() == 'العربية') {
      return 'معلومات عنا';
    }
    if (getlanguage() == 'English') {
      return 'About us';
    }
  }
  String info8() {
    if (getlanguage() == 'العربية') {
      return 'حول المنصة';
    }
    if (getlanguage() == 'English') {
      return 'About the platform';
    }
  }
  String info9() {
    if (getlanguage() == 'العربية') {
      return 'طلب الاعلان علي المنصة';
    }
    if (getlanguage() == 'English') {
      return 'Advertising request on the platform';
    }
  }
  map2() {
    if (getlanguage() == 'العربية') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "رابط الموقع",
            style: TextStyle(
                color: primaryColor,
                fontFamily: "Amiri",
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.location_on_outlined,
            size: 15,
            color: primaryColor,
          ),
        ],
      );
    }
    if (getlanguage() == 'English') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Location link",
            style: TextStyle(
                color: primaryColor,
                fontFamily: "Amiri",
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.location_on_outlined,
            size: 15,
            color: primaryColor,
          ),
        ],
      );
    }
  }

  String tservices() {
    if (getlanguage() == 'العربية') {
      return 'الخدمات';
    }
    if (getlanguage() == 'English') {
      return 'Services';
    }
  }

  String tabout() {
    if (getlanguage() == 'العربية') {
      return 'عن المنصة';
    }
    if (getlanguage() == 'English') {
      return 'About the platform';
    }
  }

  String ttoast() {
    if (getlanguage() == 'العربية') {
      return 'الرجاء اختيار اللغة';
    }
  }

  String searchservice() {
    if (getlanguage() == 'العربية') {
      return 'البحث عن خدمة';
    }
    if (getlanguage() == 'English') {
      return 'Search for a service';
    }
  }

  Servicerequest() {
    if (getlanguage() == 'العربية') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.balance_outlined,
            color: primaryColor,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            "طلب الخدمة",
            style: TextStyle(color: primaryColor,fontWeight: FontWeight.w500,  fontFamily: "Amiri",),
          ),
        ],
      );
    }
    if (getlanguage() == 'English') {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Service request",
            style: TextStyle(color: primaryColor,fontWeight: FontWeight.w500,  fontFamily: "Amiri",),
          ),
          SizedBox(
            width: 5,
          ),
          Icon(
            Icons.balance_outlined,
            color: primaryColor,
            size: 15,
          ),
        ],
      );
    }
  }

  String welcome() {
    if (getlanguage() == 'العربية') {
      return 'مرحبا بعودتك';
    }
    if (getlanguage() == 'English') {
      return 'Welcome Back';
    }
    if (getlanguage() == null) {
      return 'مرحبا بعودتك';
    }
  }

  String welcome2() {
    if (getlanguage() == 'العربية') {
      return 'الرجاء اختيار اللغة للمرة الاولي';
    }
    if (getlanguage() == 'English') {
      return 'Select your language for first time';
    }
    if (getlanguage() == null) {
      return 'الرجاء اختيار اللغة للمرة الاولي';
    }
  }

}
