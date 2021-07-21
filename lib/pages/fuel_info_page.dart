import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/new_image_provider.dart';
import '../providers/new_fuel_information.dart';
import '../widget/fuel_info_body.dart';
import '../widget/ImagePicker.dart';

class FuelInfoPage extends StatefulWidget {
  static const routeName = '/fuel-info-page';

  @override
  _FuelInfoPageState createState() => _FuelInfoPageState();
}

class _FuelInfoPageState extends State<FuelInfoPage> {
  var _isLoading = false;
  var _isInit = true;
  openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ImagePicker();
      },
    );
  }

  Future<void> _storeInfo() async {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      File image = Provider.of<NewImage>(context).image;
      try {
        await Provider.of<NewFuelInformation>(context).getNewFuelInfo(image);
      } catch (e) {
        print(e);
      }
      setState(() {
        _isLoading = false;
      });
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    _storeInfo();
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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : FuelInfoBody(),
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
