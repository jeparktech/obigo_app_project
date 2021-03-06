import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/new_image_provider.dart';
import '../providers/new_fuel_information.dart';
import '../providers/fuel_informations_provider.dart';
import '../widget/fuel_info_body.dart';
import '../widget/ImagePicker.dart';

class FuelInfoPage extends StatefulWidget {
  static const routeName = '/fuel-info-page';

  @override
  _FuelInfoPageState createState() => _FuelInfoPageState();
}

class _FuelInfoPageState extends State<FuelInfoPage> {
  var _form = GlobalKey<FormState>();
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

  Future<void> saveForm() async {
    print('saveForm');
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<FuelInformations>(context, listen: false)
          .addFuelInformation(
              Provider.of<NewFuelInformation>(context, listen: false)
                  .fuelInfo!);
      print(Provider.of<NewFuelInformation>(context, listen: false).fuelInfo!);
    } catch (error) {}
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).popAndPushNamed('/');
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
          onPressed: () => Navigator.of(context).popAndPushNamed('/'),
        ),
        centerTitle: true,
        title: Text(
          '?????? ????????? ??????',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : FuelInfoBody(_form),
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
                  "???????????????",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            GestureDetector(
              onTap: saveForm,
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.symmetric(vertical: 20),
                height: 70,
                color: Color(0xFFA4A4A4),
                child: Text(
                  "?????? ????????? ????????????",
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
