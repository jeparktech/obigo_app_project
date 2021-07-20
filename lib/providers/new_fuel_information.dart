import 'dart:io';

import 'package:flutter/foundation.dart';

import '../model/fuel_information.dart';
import '../functions/receipt_recognize.dart';

class NewFuelInformation with ChangeNotifier {
  Future<FuelInformation>? _fuelInfo;

  Future<FuelInformation>? get fuelInfo {
    return _fuelInfo;
  }

  Future<FuelInformation> getNewFuelInfo(File image) async {
    _fuelInfo = ReceiptRecognize(image).detectFuelInfo();

    return _fuelInfo!;
  }
}
