import 'package:flutter/foundation.dart';

import '../model/fuel_information.dart';

class FuelQuantityData {
  final int month;
  final double quantity;

  FuelQuantityData({required this.month, required this.quantity});
}

class MonthlyFuelQuantity with ChangeNotifier {
  List<FuelQuantityData> _monthlyQuantityData = [
    FuelQuantityData(month: 1, quantity: 0),
    FuelQuantityData(month: 2, quantity: 0),
    FuelQuantityData(month: 3, quantity: 0),
    FuelQuantityData(month: 4, quantity: 0),
    FuelQuantityData(month: 5, quantity: 0),
    FuelQuantityData(month: 6, quantity: 0),
    FuelQuantityData(month: 7, quantity: 0),
    FuelQuantityData(month: 8, quantity: 0),
    FuelQuantityData(month: 9, quantity: 0),
    FuelQuantityData(month: 10, quantity: 0),
    FuelQuantityData(month: 11, quantity: 0),
    FuelQuantityData(month: 12, quantity: 0),
  ];

  List<FuelQuantityData> get monthlyQuantityData {
    return _monthlyQuantityData;
  }

  double sumMonthlyQuantity(List<FuelInformation> fuelInfoList, int month) {
    try {
      double quantity = 0;
      fuelInfoList.forEach((fuelInfo) {
        int infoMonth = DateTime.parse(fuelInfo.date).month;
        if (infoMonth == month) {
          quantity += fuelInfo.quantity;
        }
      });
      return quantity;
    } catch (error) {
      throw error;
    }
  }

  void addMonthlyQuantity(List<FuelInformation> fuelInfoList) {
    for (int i = 0; i < _monthlyQuantityData.length; i++) {
      _monthlyQuantityData[i] = FuelQuantityData(
          month: i + 1, quantity: sumMonthlyQuantity(fuelInfoList, i + 1));
    }
    notifyListeners();
  }
}
