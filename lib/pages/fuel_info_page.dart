import 'package:flutter/material.dart';

class FuelInfoPage extends StatelessWidget {
  static const routeName = '/fuel-info-page';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: Text('주유 영수증 정보',
            style: TextStyle(color: Colors.white,fontSize: 16),
          ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {},
        child: Row(
          children: <Widget> [
            Container(
              width: MediaQuery.of(context).size.width/2,
              padding: EdgeInsets.symmetric(vertical: 20),
              height: 70,
              color: Color(0xFF1AB5E6),
              child: Text("재촬영하기", 
              style: TextStyle(
                color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,),
            ),
            Container(
              width: MediaQuery.of(context).size.width/2,
              padding: EdgeInsets.symmetric(vertical: 20),
              height: 70,
              color: Color(0xFFA4A4A4),
              child: Text("주유 영수증 등록하기", 
              style: TextStyle(
                color: Colors.white, fontSize: 14),
              textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}