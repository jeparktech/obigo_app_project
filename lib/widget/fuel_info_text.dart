import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/fuel_information.dart';
import '../providers/new_fuel_information.dart';
import '../providers/fuel_informations_provider.dart';

class FuelInfoText extends StatefulWidget {
  final _form;
  FuelInfoText(this._form);
  @override
  _FuelInfoTextState createState() => _FuelInfoTextState();
}

class _FuelInfoTextState extends State<FuelInfoText> {
  var _isFieldEmpty = false;

  // Future<void> saveForm() async {
  //   final isValid = _form.currentState!.validate();
  //   if (!isValid) {
  //     return;
  //   }
  //   _form.currentState!.save();
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try {
  //     await Provider.of<FuelInformations>(context, listen: false)
  //         .addFuelInformation(_editedFuelInfo);
  //   } catch (error) {}
  //   setState(() {
  //     _isLoading = false;
  //   });
  //   Navigator.of(context).popAndPushNamed('/');
  // }

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
