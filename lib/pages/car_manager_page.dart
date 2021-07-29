import 'package:flutter/material.dart';

import '../widget/car_manager_info.dart';

class CarManagerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Car Manager',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              //   Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon:
                  Icon(Icons.notifications_active_rounded, color: Colors.white),
            ),
          ],
        ),
        body: CarManagerInfo(),
        bottomNavigationBar: _bottomNavigationBarWidget(),
      ),
    );
  }

  Widget _bottomNavigationBarWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFF1F1F1),
      iconSize: 25,
      selectedItemColor: Colors.black,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Color(0xFF808080)),
          title: Text(
            'Home',
            style: TextStyle(
              color: Color(0xFF808080),
              fontSize: 10,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Color(0xFF808080)),
          title: Text(
            'O-Store',
            style: TextStyle(
              color: Color(0xFF808080),
              fontSize: 10,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.directions_car, color: Colors.black),
          title: Text(
            'Car Manager',
            style: TextStyle(
              color: Colors.black,
              fontSize: 10,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home, color: Color(0xFF808080)),
          title: Text(
            'Display Setting',
            style: TextStyle(
              color: Color(0xFF808080),
              fontSize: 10,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_pin, color: Color(0xFF808080)),
          title: Text(
            'Mypage',
            style: TextStyle(
              color: Color(0xFF808080),
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
