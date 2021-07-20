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

  FuelInformation? isListContains(String date) {
    FuelInformation? dummy;
    _items!.forEach((fuelInfo) {
      if (fuelInfo.date == date) {
        dummy = fuelInfo;
      }
    });
    return dummy;
  }

  void addFuelInformation(FuelInformation fuelInfo) {
    fuelDBHelper.insertFuelInfo(fuelInfo);
    if (_items == null) {
      print('this list is null');
    } else if (_items!.isEmpty) {
      _items!.add(fuelInfo);
    } else {
      if (isListContains(fuelInfo.date) != null) {
        //replace the fuelInformation
      } else {
        _items!.add(fuelInfo);
      }
    }
    notifyListeners();
  }

  void deleteFuelInformation(FuelInformation fuelInfo) {
    fuelDBHelper.deleteFuelInfo(fuelInfo.date);

    if (isListContains(fuelInfo.date) != null && _items != null) {
      _items!.remove(isListContains(fuelInfo.date));
    }
    notifyListeners();
  }
}
