import 'dart:io';

import 'package:flutter/material.dart';
import 'package:obigo_app_project/widget/fuel_info_body.dart';


import '../widget/ImagePicker.dart';
import '../model/fuel_information.dart';
import '../functions/receipt_recognize.dart';

class FuelInfoPage extends StatelessWidget {
  static const routeName = '/fuel-info-page';

//camer button
  openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ImagePicker();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    File loadedImage = ModalRoute.of(context)!.settings.arguments as File;
    FuelInformation fuelInfo = await ReceiptRecognize(loadedImage).detectFuelInfo();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushNamed('/'),
        ),
        centerTitle: true,
        title: Text(
          '주유 영수증 정보',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: FuelInfoBody(),
      bottomNavigationBar: GestureDetector(
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () => openBottomSheet(context),
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.symmetric(vertical: 20),
                height: 70,
                color: Color(0xFF1AB5E6),
                child: Text(
                  "재촬영하기",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.symmetric(vertical: 20),
                height: 70,
                color: Color(0xFFA4A4A4),
                child: Text(
                  "주유 영수증 등록하기",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
