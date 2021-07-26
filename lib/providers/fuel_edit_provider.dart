import 'package:flutter/foundation.dart';

import '../model/fuel_information.dart';

class FuelEdit with ChangeNotifier {
  FuelInformation? _fuelInfo;

  FuelInformation? get fuelInfo {
    return _fuelInfo;
  }
}
