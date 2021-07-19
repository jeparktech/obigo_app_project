import 'package:flutter/material.dart';
import 'package:obigo_app_project/widget/car_manager_info.dart';
import 'package:obigo_app_project/widget/cm_bottom_bar.dart';

class CarManagerPage extends StatefulWidget {
@override
  _CarManagerPageState createState() => _CarManagerPageState();
}

class _CarManagerPageState extends State<CarManagerPage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Car Manager',
            style: TextStyle(color: Colors.white,fontSize: 16),
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
              icon: Icon(Icons.notifications_active_rounded, color: Colors.white),
            ),
          ], 
        ),
        body: CarManagerInfo(),
        bottomNavigationBar: CarManagerBottomBar(),
      ),
    );
  }
}