import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/fuel_information.dart';
import '../providers/new_fuel_information.dart';

class FuelInfoText extends StatefulWidget {
  final _form;
  FuelInfoText(this._form);
  @override
  _FuelInfoTextState createState() => _FuelInfoTextState();
}

class _FuelInfoTextState extends State<FuelInfoText> {
  var _isFieldEmpty = false;

  @override
  Widget build(BuildContext context) {
    var newInfo = Provider.of<NewFuelInformation>(context, listen: false);
    return Container(
        width: 350,
        child: Form(
          key: widget._form,
          child: Column(
            children: <Widget>[
              Container(
                width: 330,
                //height: 35,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '주유소명',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      //height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        initialValue: newInfo.fuelInfo!.stationName,
                        onSaved: (value) {
                          newInfo.updateFuelInfo(FuelInformation(
                              id: newInfo.fuelInfo!.id,
                              date: newInfo.fuelInfo!.date,
                              fuelType: newInfo.fuelInfo!.fuelType,
                              quantity: newInfo.fuelInfo!.quantity,
                              unitPrice: newInfo.fuelInfo!.unitPrice,
                              totalPrice: newInfo.fuelInfo!.totalPrice,
                              stationName: value!));
                        },
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              _isFieldEmpty = true;
                            });
                            return '정보를 입력해주세요';
                          }
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 330,
                //height: 35,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '주유금액',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      //height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        initialValue: newInfo.fuelInfo!.totalPrice.toString(),
                        onSaved: (value) {
                          newInfo.updateFuelInfo(FuelInformation(
                              id: newInfo.fuelInfo!.id,
                              date: newInfo.fuelInfo!.date,
                              fuelType: newInfo.fuelInfo!.fuelType,
                              quantity: newInfo.fuelInfo!.quantity,
                              unitPrice: newInfo.fuelInfo!.unitPrice,
                              totalPrice: int.parse(value!),
                              stationName: newInfo.fuelInfo!.stationName));
                        },
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              _isFieldEmpty = true;
                            });
                            return '정보를 입력해주세요.';
                          }
                          if (int.tryParse(value) == null) {
                            return '숫자만 입력해주세요.';
                          }
                          if (int.parse(value) <= 0) {
                            return '0 보다 큰 숫자를 입력해주세요.';
                          }
                          return null;
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 330,
                //height: 35,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '주유단가',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      //height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        initialValue: newInfo.fuelInfo!.unitPrice.toString(),
                        onSaved: (value) {
                          newInfo.updateFuelInfo(FuelInformation(
                              id: newInfo.fuelInfo!.id,
                              date: newInfo.fuelInfo!.date,
                              fuelType: newInfo.fuelInfo!.fuelType,
                              quantity: newInfo.fuelInfo!.quantity,
                              unitPrice: int.parse(value!),
                              totalPrice: newInfo.fuelInfo!.totalPrice,
                              stationName: newInfo.fuelInfo!.stationName));
                        },
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              _isFieldEmpty = true;
                            });
                            return '정보를 입력해주세요.';
                          }
                          if (int.tryParse(value) == null) {
                            return '숫자만 입력해주세요.';
                          }
                          if (int.parse(value) <= 0) {
                            return '0 보다 큰 숫자를 입력해주세요.';
                          }
                          return null;
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 330,
                //height: 35,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '주유리터',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      //height: 30,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        initialValue: newInfo.fuelInfo!.quantity.toString(),
                        onSaved: (value) {
                          newInfo.updateFuelInfo(FuelInformation(
                              id: newInfo.fuelInfo!.id,
                              date: newInfo.fuelInfo!.date,
                              fuelType: newInfo.fuelInfo!.fuelType,
                              quantity: double.parse(value!),
                              unitPrice: newInfo.fuelInfo!.unitPrice,
                              totalPrice: newInfo.fuelInfo!.totalPrice,
                              stationName: newInfo.fuelInfo!.stationName));
                        },
                        validator: ((value) {
                          if (value == null || value.isEmpty) {
                            setState(() {
                              _isFieldEmpty = true;
                            });
                            return '정보를 입력해주세요.';
                          }
                          if (double.tryParse(value) == null) {
                            return '숫자만 입력해주세요.';
                          }
                          if (double.parse(value) <= 0) {
                            return '0 보다 큰 숫자를 입력해주세요.';
                          }
                          return null;
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 330,
                //height: 35,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '거래일시',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      //height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        initialValue: newInfo.fuelInfo!.date,
                        onSaved: (value) {
                          newInfo.updateFuelInfo(FuelInformation(
                              id: newInfo.fuelInfo!.id,
                              date: value!,
                              fuelType: newInfo.fuelInfo!.fuelType,
                              quantity: newInfo.fuelInfo!.quantity,
                              unitPrice: newInfo.fuelInfo!.unitPrice,
                              totalPrice: newInfo.fuelInfo!.totalPrice,
                              stationName: newInfo.fuelInfo!.stationName));
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
