import 'package:flutter/material.dart';

import '../model/fuel_information.dart';

class FuelInformations with ChangeNotifier {
  List<FuelInformations> _items = [];

  List<FuelInformations> get items {
    return [..._items];
  }
}
