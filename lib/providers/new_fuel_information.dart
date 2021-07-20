import 'dart:io';

import 'package:flutter/foundation.dart';

import '../model/fuel_information.dart';
import '../functions/receipt_recognize.dart';

class NewFuelInformation with ChangeNotifier {
  Future<FuelInformation>? fuelInfo;

  Future<FuelInformation> getNewFuelInfo(File image) async {
    fuelInfo = ReceiptRecognize(image).detectFuelInfo();

    return fuelInfo!;
  }
}
