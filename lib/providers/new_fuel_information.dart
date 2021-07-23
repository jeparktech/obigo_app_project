import 'dart:io';

import 'package:flutter/foundation.dart';

import '../model/fuel_information.dart';
import '../functions/receipt_recognize.dart';

class NewFuelInformation with ChangeNotifier {
  FuelInformation? _fuelInfo;
  bool _isEdited = false;

  FuelInformation? get fuelInfo {
    return _fuelInfo;
  }

  bool get isEdited {
    return _isEdited;
  }

  FuelInformation? updateFuelInfo(FuelInformation fuelInfo) {
    _fuelInfo = fuelInfo;

    return _fuelInfo;
  }

  Future<void> getNewFuelInfo(File image) async {
    _fuelInfo = await ReceiptRecognize(image).detectFuelInfo();
    notifyListeners();
  }
}
