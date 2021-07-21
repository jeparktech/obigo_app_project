import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/fuel_information.dart';
import '../providers/new_fuel_information.dart';

class FuelInfoText extends StatefulWidget {
  @override
  _FuelInfoTextState createState() => _FuelInfoTextState();
}

class _FuelInfoTextState extends State<FuelInfoText> {
  final _form = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    var newInfo =
        Provider.of<NewFuelInformation>(context, listen: false).fuelInfo;
    return Container(
        height: 230,
        width: 350,
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              Container(
                width: 330,
                height: 35,
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '주유소명',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        initialValue: newInfo!.stationName,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 330,
                height: 35,
                margin: EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '주유금액',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        initialValue: newInfo.totalPrice.toString(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 330,
                height: 35,
                margin: EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '주유단가',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        initialValue: newInfo.unitPrice.toString(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 330,
                height: 35,
                margin: EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '주유리터',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        initialValue: newInfo.quantity.toString(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 330,
                height: 35,
                margin: EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '거래일시',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        initialValue: newInfo.date,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  

}

