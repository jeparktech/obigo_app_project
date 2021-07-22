import 'package:flutter/foundation.dart';

import '../model/fuel_information.dart';

class FuelQuantityData {
  final int month;
  final double quantity;

  FuelQuantityData({required this.month, required this.quantity});
}

class FuelCostAndTimesData {
  final int month;
  final int totalCost;
  final int fuelTimes;

  FuelCostAndTimesData(
      {required this.month, required this.totalCost, required this.fuelTimes});
}

class Statistics with ChangeNotifier {
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
  List<FuelCostAndTimesData> _monthlyCostAndTimesData = [
    FuelCostAndTimesData(month: 1, totalCost: 0, fuelTimes: 0),
    FuelCostAndTimesData(month: 2, totalCost: 0, fuelTimes: 0),
    FuelCostAndTimesData(month: 3, totalCost: 0, fuelTimes: 0),
    FuelCostAndTimesData(month: 4, totalCost: 0, fuelTimes: 0),
    FuelCostAndTimesData(month: 5, totalCost: 0, fuelTimes: 0),
    FuelCostAndTimesData(month: 6, totalCost: 0, fuelTimes: 0),
    FuelCostAndTimesData(month: 7, totalCost: 0, fuelTimes: 0),
    FuelCostAndTimesData(month: 8, totalCost: 0, fuelTimes: 0),
    FuelCostAndTimesData(month: 9, totalCost: 0, fuelTimes: 0),
    FuelCostAndTimesData(month: 10, totalCost: 0, fuelTimes: 0),
    FuelCostAndTimesData(month: 11, totalCost: 0, fuelTimes: 0),
    FuelCostAndTimesData(month: 12, totalCost: 0, fuelTimes: 0),
  ];
  double _qttThisMonth = 0;
  int _totalCostThisMonth = 0;

  List<FuelQuantityData> get monthlyQuantityData {
    return _monthlyQuantityData;
  }

  List<FuelCostAndTimesData> get monthlyCostAndTimesData {
    return _monthlyCostAndTimesData;
  }

  double get qttThisMonth {
    return _qttThisMonth;
  }

  int get totalCostThisMonth {
    return _totalCostThisMonth;
  }

  void getDataThisMonth(List<FuelInformation> fuelInfoList) {
    int yearNow = DateTime.now().year;
    int monthNow = DateTime.now().month;
    _qttThisMonth = 0;
    _totalCostThisMonth = 0;
    fuelInfoList.forEach((fuelInfo) {
      int infoYear = DateTime.parse(fuelInfo.date).year;
      int infoMonth = DateTime.parse(fuelInfo.date).month;

      if (yearNow == infoYear && monthNow == infoMonth) {
        _qttThisMonth += fuelInfo.quantity;
        _totalCostThisMonth += fuelInfo.totalPrice;
      }
    });
  }

  Map<String, dynamic> sumMonthlyData(
      List<FuelInformation> fuelInfoList, int month) {
    try {
      double quantity = 0;
      int totalCost = 0;
      int fuelTimes = 0;
      fuelInfoList.forEach((fuelInfo) {
        int infoMonth = DateTime.parse(fuelInfo.date).month;
        //int infoYear = DateTime.parse(fuelInfo.date).year;
        if (infoMonth == month) {
          quantity += fuelInfo.quantity;
          totalCost += fuelInfo.totalPrice;
          fuelTimes++;
        }
      });
      return {
        'quantity': quantity,
        'totalCost': totalCost,
        'fuelTimes': fuelTimes
      };
    } catch (error) {
      throw error;
    }
  }

  void addMonthlyQuantity(List<FuelInformation> fuelInfoList) {
    for (int i = 0; i < _monthlyQuantityData.length; i++) {
      _monthlyQuantityData[i] = FuelQuantityData(
          month: i + 1,
          quantity: sumMonthlyData(fuelInfoList, i + 1)['quantity'] as double);
    }
    notifyListeners();
  }

  void addMonthlyCostAndTimes(List<FuelInformation> fuelInfoList) {
    for (int i = 0; i < _monthlyCostAndTimesData.length; i++) {
      _monthlyCostAndTimesData[i] = FuelCostAndTimesData(
          month: i + 1,
          totalCost: sumMonthlyData(fuelInfoList, i + 1)['totalCost'] as int,
          fuelTimes: sumMonthlyData(fuelInfoList, i + 1)['fuelTimes'] as int);
    }
  }
}
