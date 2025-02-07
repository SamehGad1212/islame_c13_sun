import 'package:flutter/material.dart';
import 'package:islame_c13_sunday/home/tabs/Sebha_tab.dart';
import 'package:islame_c13_sunday/home/tabs/ahadeth_tab.dart';
import 'package:islame_c13_sunday/home/tabs/quran_tab.dart';
import 'package:islame_c13_sunday/home/tabs/radio_tab.dart';
import 'package:islame_c13_sunday/home/tabs/time_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/${getBackgroundImageName()}.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          backgroundColor: Color(0xFFE2BE7F),
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            setState(() {});
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Color(0xFF202020),
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: _buildNavItem("quran", 0),
              label: "Quran",
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem("ahadeth", 1),
              label: "Ahadeth",
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem("sebha", 2),
              label: "Tasebha",
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem("ic_radio", 3),
              label: "Radio",
            ),
            BottomNavigationBarItem(
              icon: _buildNavItem("time", 4),
              label: "Time",
            ),
          ],
        ),
        body:tabs [currentIndex],
      ),
    );
  }
  List<Widget> tabs=[
      QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
String getBackgroundImageName(){
    switch(currentIndex){
      case 0:
        return "home_bg";
      case 1:
        return "ahadeth_bg";
      case 2:
        return "sebha_bg";
        case 3:
        return "radio_bg";

      default:
        return "time_bg";
    }
}
  Widget _buildNavItem(String imageName, int index) {
    return currentIndex == index
        ? Container(
            padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: Color(0x80202020),
            ),
            child: ImageIcon(
              AssetImage('assets/images/$imageName.png'),
            ),
          )
        : ImageIcon(
            AssetImage("assets/images/$imageName.png"),
          );
  }
}
