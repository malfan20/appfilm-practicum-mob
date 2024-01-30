import 'package:flutter/material.dart';
import 'package:flutter_application_1/Page2.dart';
import 'package:flutter_application_1/Page3.dart';
import 'package:flutter_application_1/Page4.dart';

class Bottombar extends StatefulWidget {
  const Bottombar({super.key});

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _selectIndex = 0;
  List<Widget> _screenList = [
    Page2(),
    Page3(),
    Page4(),
  ];

  void gantihal(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenList[_selectIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectIndex,
          onTap: gantihal,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.camera_roll_sharp), label: 'Movie'),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_rounded), label: 'Profile'),
          ]),
    );
  }
}
