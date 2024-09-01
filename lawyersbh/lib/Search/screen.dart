import 'package:flutter/material.dart';
import 'package:lawyers_bh/config.dart';
import 'package:lawyers_bh/language/language_class.dart';

import '../Models/Service_Model.dart';
import '../home_companant/SingleTips2.dart';
import 'Api_service.dart';

class SearchUser extends SearchDelegate {
  final FetchUserList _userList = FetchUserList();

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.close,color: primaryColor,))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios,color:primaryColor,),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
final Language _language= Language();
  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<Service_Model>>(
        future: _userList.getserviceList(query: query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                backgroundColor: primaryColor,
                color:Colors.white,
                strokeWidth: 2,
              )
            );
          }
          List<Service_Model> data = snapshot.data;
          _selectlang3(index) {
            if (_language.getlanguage() == 'العربية') {
              return data[index].arName;
            }
            if (_language.getlanguage() == 'English') {
              return data[index].enName;
            }
          }
          return Padding(
            padding: const EdgeInsets.all(10),
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: data.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 3,
                childAspectRatio: 0.90,
              ),
              itemBuilder: (
                  ctx,
                  index,
                  ) {
                return SingleTips2(
                  title: _selectlang3(index),
                  image2: data[index].imagePath,
                );
              },
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return  Center(
      child: Text(_language.searchservice(),style: const TextStyle(  fontFamily: "Amiri",fontWeight: FontWeight.w500),),
    );
  }
}
