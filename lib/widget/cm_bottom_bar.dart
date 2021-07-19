import 'package:flutter/material.dart';

class CarManagerBottomBar extends StatefulWidget {
@override
  _CarManagerBottomBarState createState() => _CarManagerBottomBarState();
}

class _CarManagerBottomBarState extends State<CarManagerBottomBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor:  Color(0xFFF1F1F1),
          iconSize: 25,
          selectedItemColor: Colors.black,
          items: const <BottomNavigationBarItem> [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color:Color(0xFF808080)),
              title: Text('Home', style: TextStyle(color: Color(0xFF808080), fontSize: 10,),),
      
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color:Color(0xFF808080)),
              title: Text('O-Store', style: TextStyle(color: Color(0xFF808080), fontSize: 10,),),

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_car, color:Colors.black),
              title: Text('Car Manager', style: TextStyle(color: Colors.black, fontSize: 10,),),

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color:Color(0xFF808080)),
              title: Text('Display Setting', style: TextStyle(color: Color(0xFF808080), fontSize: 10,),),

            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_pin, color:Color(0xFF808080)),
              title: Text('Mypage', style: TextStyle(color: Color(0xFF808080), fontSize: 10,),),
            ),
          ],
        );
  }
}