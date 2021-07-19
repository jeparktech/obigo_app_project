import 'package:flutter/material.dart';

import '../model/fuel_information.dart';
import '../database/fuelDBHelper.dart';

class FuelInformations with ChangeNotifier {
  FuelDBHelper fuelDBHelper = FuelDBHelper();
  List<FuelInformation>? _items;

  FuelInformations() {
    fuelDBHelper.fuelInfos.then((list) {
      _items = list;
    });
  }

  List<FuelInformation> get items {
    return [..._items!];
  }

  bool isListContains(String date) {
    bool b = false;
    _items!.forEach((fuelInfo) {
      if (fuelInfo.date == date) {
        b = true;
      }
    });
    return b;
  }

  void addFuelInformation(FuelInformation fuelInfo) {
    fuelDBHelper.insertFuelInfo(fuelInfo);
    if (_items == null) {
      print('this list is null');
    } else if (_items!.isEmpty) {
      _items!.add(fuelInfo);
    } else {
      if (isListContains(fuelInfo.date)) {
        //replace the fuelInformation
      } else {
        _items!.add(fuelInfo);
      }
    }
    notifyListeners();
  }

  void deleteFuelInformation(FuelInformation fuelInfo) {
    fuelDBHelper.deleteFuelInfo(fuelInfo.date);
  }
}
