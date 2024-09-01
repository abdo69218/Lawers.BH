import 'package:flutter/material.dart';
import 'package:lawyers_bh/config.dart';
import 'package:lawyers_bh/home_companant/home2.dart';
import '../home_screen.dart';
import '../language/language_class.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomSelectedIndex = 0;

  List<BottomNavigationBarItem> buildBottomNavBarItems() {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.balance),
        label: (_language.tservices()),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.co_present_outlined),
        label: (_language.tabout()),
      ),
    ];
  }

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: const [
        HomeScreen(),
        Home2(),
      ],
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      bottomSelectedIndex = index;
      pageController.animateToPage(index,
          duration: const Duration(milliseconds: 200), curve: Curves.ease);
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _language.getlanguage();
  }

  final Language _language = Language();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildPageView(),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 5, right: 5),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(4, 4), // changes position of shadow
            ),
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: primaryColor,
          currentIndex: bottomSelectedIndex,
          onTap: (index) {
            bottomTapped(index);
          },
          items: buildBottomNavBarItems(),
          backgroundColor: scaffoldBackgroundColor,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 0,

        ),
      ),
    );
  }
}
