import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/fuel_information.dart';
//import '../database/fuelDBHelper.dart';

class FuelInformations with ChangeNotifier {
  // FuelDBHelper fuelDBHelper = FuelDBHelper();
  List<FuelInformation> _items = [];

  List<FuelInformation> get items {
    return [..._items];
  }

  // FuelInformation? isListContains(String date) {
  //   FuelInformation? dummy;
  //   _items!.forEach((fuelInfo) {
  //     if (fuelInfo.date == date) {
  //       dummy = fuelInfo;
  //     }
  //   });
  //   return dummy;
  // }

  Future<void> addFuelInformation(FuelInformation fuelInfo) async {
    final url = Uri.parse(
        'https://obigo-app-project-default-rtdb.firebaseio.com/fuelInfos.json');
    try {
      final response =
          await http.post(url, body: json.encode(fuelInfo.toMap()));
      final newFuelInfo = FuelInformation(
          id: json.decode(response.body)['name'],
          date: fuelInfo.date,
          fuelType: fuelInfo.fuelType,
          quantity: fuelInfo.quantity,
          unitPrice: fuelInfo.unitPrice,
          totalPrice: fuelInfo.totalPrice,
          stationName: fuelInfo.stationName);
      items.add(newFuelInfo);
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> updateFuelInformation(
      String id, FuelInformation newFuelInfo) async {
    final fuelInfoIndex = _items.indexWhere((info) => info.id == id);
    if (fuelInfoIndex >= 0) {
      final url = Uri.parse(
          'https://obigo-app-project-default-rtdb.firebaseio.com/fuelInfos/$id.json');
      try {
        await http.patch(url, body: json.encode(newFuelInfo.toMap()));
        _items[fuelInfoIndex] = newFuelInfo;
        notifyListeners();
      } catch (error) {
        throw error;
      }
    }
  }

  Future<void> deleteFuelInformation(String id) async {
    final url = Uri.parse(
        'https://obigo-app-project-default-rtdb.firebaseio.com/fuelInfos/$id.json');
  }
}
