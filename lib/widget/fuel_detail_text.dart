import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/fuel_information.dart';
import '../providers/new_fuel_information.dart';

class FuelDetailText extends StatefulWidget {
  final _form;

  FuelDetailText(this._form);
  @override
  _FuelDetailTextState createState() => _FuelDetailTextState();
}

class _FuelDetailTextState extends State<FuelDetailText> {
  var _isFieldEmpty = false;

  @override
  Widget build(BuildContext context) {
    final savedInfo = Provider.of<NewFuelInformation>(context);
    return Container(
        width: 350,
        child: Form(
          key: widget._form,
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
                        initialValue: savedInfo.fuelInfo!.stationName,
                        onSaved: (value) {
                          savedInfo.updateFuelInfo(FuelInformation(
                              id: savedInfo.fuelInfo!.id,
                              date: savedInfo.fuelInfo!.date,
                              fuelType: savedInfo.fuelInfo!.fuelType,
                              quantity: savedInfo.fuelInfo!.quantity,
                              unitPrice: savedInfo.fuelInfo!.unitPrice,
                              totalPrice: savedInfo.fuelInfo!.totalPrice,
                              stationName: value!));
                        },
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              _isFieldEmpty = true;
                            });
                          }
                        }),
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
                        initialValue: savedInfo.fuelInfo!.totalPrice.toString(),
                        onSaved: (value) {
                          savedInfo.updateFuelInfo(FuelInformation(
                              id: savedInfo.fuelInfo!.id,
                              date: savedInfo.fuelInfo!.date,
                              fuelType: savedInfo.fuelInfo!.fuelType,
                              quantity: savedInfo.fuelInfo!.quantity,
                              unitPrice: savedInfo.fuelInfo!.unitPrice,
                              totalPrice: int.parse(value!),
                              stationName: savedInfo.fuelInfo!.stationName));
                        },
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              _isFieldEmpty = true;
                            });
                          }
                        }),
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
                        initialValue: savedInfo.fuelInfo!.unitPrice.toString(),
                        onSaved: (value) {
                          savedInfo.updateFuelInfo(FuelInformation(
                              id: savedInfo.fuelInfo!.id,
                              date: savedInfo.fuelInfo!.date,
                              fuelType: savedInfo.fuelInfo!.fuelType,
                              quantity: savedInfo.fuelInfo!.quantity,
                              unitPrice: int.parse(value!),
                              totalPrice: savedInfo.fuelInfo!.totalPrice,
                              stationName: savedInfo.fuelInfo!.stationName));
                        },
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              _isFieldEmpty = true;
                            });
                          }
                        }),
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
                        initialValue: savedInfo.fuelInfo!.quantity.toString(),
                        onSaved: (value) {
                          savedInfo.updateFuelInfo(FuelInformation(
                              id: savedInfo.fuelInfo!.id,
                              date: savedInfo.fuelInfo!.date,
                              fuelType: savedInfo.fuelInfo!.fuelType,
                              quantity: double.parse(value!),
                              unitPrice: savedInfo.fuelInfo!.unitPrice,
                              totalPrice: savedInfo.fuelInfo!.totalPrice,
                              stationName: savedInfo.fuelInfo!.stationName));
                        },
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              _isFieldEmpty = true;
                            });
                          }
                        }),
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
                        initialValue: savedInfo.fuelInfo!.date,
                        onSaved: (value) {
                          savedInfo.updateFuelInfo(FuelInformation(
                              id: savedInfo.fuelInfo!.id,
                              date: value!,
                              fuelType: savedInfo.fuelInfo!.fuelType,
                              quantity: savedInfo.fuelInfo!.quantity,
                              unitPrice: savedInfo.fuelInfo!.unitPrice,
                              totalPrice: savedInfo.fuelInfo!.totalPrice,
                              stationName: savedInfo.fuelInfo!.stationName));
                        },
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              _isFieldEmpty = true;
                            });
                          }
                          if (!RegExp(r'202[0-9]-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])')
                                  .hasMatch(value!) ||
                              value.length > 10) {
                            return '잘못된 형식입니다. (YYYY-MM-DD)';
                          }
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              _isFieldEmpty
                  ? Container(
                      child: Container(
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      child: Text(
                        "주유 영수증 정보가 누락되었습니다. 다시 촬영하거나 직접 입력해 주세요.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xFFFF0000),
                        ),
                      ),
                    ))
                  : Container(),
            ],
          ),
        ));
  }
}
