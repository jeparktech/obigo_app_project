import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widget/fuel_info_text.dart';
import '../model/fuel_information.dart';
import '../providers/new_fuel_information.dart';

class FuelInfoBody extends StatelessWidget {
  final File loadedImage;
  FuelInformation? loadedFuelInfo;

  FuelInfoBody(this.loadedImage);

  @override
  Widget build(BuildContext context) {
    final newInfo = Provider.of<NewFuelInformation>(context);

    return Container(
      color: Colors.white,
      child: ListView(
        shrinkWrap: true,
        children: [
          //Car info container
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              border: Border.all(width: 0.5, color: Color(0xFF8E8E8E)),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(10),
                  width: 320,
                  height: 20,
                  child: Text(
                    "Fuel Report",
                    style: TextStyle(
                      color: Color(0xFF333333),
                      fontSize: 15,
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 40,
                      color: Color(0xFF707070),
                    )),
              ],
            ),
          ),
          //msg container
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 10),
            child: Column(
              children: <Widget>[
                Text(
                  "주유 영수증 정보를 확인해 주세요.",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "영수증 정보는 5분에서 3시간 이내에 반영됩니다",
                  style: TextStyle(fontSize: 13),
                )
              ],
            ),
          ),
          //Image Container
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(bottom: 15),
              height: 175,
              width: 175,
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.black,
              )),
              child: Image.file(loadedImage, fit: BoxFit.cover),
            ),
          ),
          //fuel info text field
          loadedFuelInfo == null
              ? FutureBuilder(
                  future: newInfo.getNewFuelInfo(loadedImage),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      print('loading..');
                      return Align(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Error: ${snapshot.error}',
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    } else {
                      loadedFuelInfo = snapshot.data as FuelInformation;
                      return FuelInfoText(loadedFuelInfo!);
                    }
                  },
                )
              : FuelInfoText(loadedFuelInfo!),
          //msg container
        ],
      ),
    );
  }
}
