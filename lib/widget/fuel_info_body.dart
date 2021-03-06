import 'dart:io';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../widget/fuel_info_text.dart';
import '../providers/new_image_provider.dart';

class FuelInfoBody extends StatelessWidget {
  final _form;
  FuelInfoBody(this._form);
  @override
  Widget build(BuildContext context) {
    File loadedImage = Provider.of<NewImage>(context, listen: false).image;
    return Container(
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
              child: Image.file(loadedImage, fit: BoxFit.cover),
            ),
          ),
          //fuel info text field
          FuelInfoText(_form),
          //msg container
        ],
      ),
    );
  }
}
