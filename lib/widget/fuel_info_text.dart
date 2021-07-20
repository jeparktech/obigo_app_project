import 'package:flutter/material.dart';

import '../model/fuel_information.dart';

class FuelInfoText extends StatefulWidget {
  FuelInformation loadedFuelInfo;

  FuelInfoText(this.loadedFuelInfo);
  @override
  _FuelInfoTextState createState() => _FuelInfoTextState();
}

class _FuelInfoTextState extends State<FuelInfoText> {
  final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
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
                        initialValue: widget.loadedFuelInfo.stationName,
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        initialValue:
                            widget.loadedFuelInfo.totalPrice.toString(),
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        initialValue:
                            widget.loadedFuelInfo.unitPrice.toString(),
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
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        initialValue: widget.loadedFuelInfo.quantity.toString(),
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
                        initialValue: widget.loadedFuelInfo.date,
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
