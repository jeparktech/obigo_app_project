import 'dart:io';

import 'package:flutter/foundation.dart';

import '../model/fuel_information.dart';
import '../functions/receipt_recognize.dart';

class NewFuelInformation with ChangeNotifier {
  FuelInformation? _fuelInfo;

  FuelInformation? get fuelInfo {
    return _fuelInfo;
  }

  void updateFuelInfo(FuelInformation fuelInfo) {
    _fuelInfo = fuelInfo;
  }

  Future<void> getNewFuelInfo(File image) async {
    _fuelInfo = await ReceiptRecognize(image).detectFuelInfo();
    notifyListeners();
  }
}
