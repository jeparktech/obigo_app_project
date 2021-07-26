import 'dart:convert';
import 'dart:io';

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

  FuelInformation findById(String id) {
    return _items.firstWhere((fuelInfo) => fuelInfo.id == id);
  }

  Future<void> fetchAndSetFuelInfos() async {
    final url = Uri.parse(
        'https://obigo-app-project-default-rtdb.firebaseio.com/fuelInfos.json');
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (extractedData == null) return;
      final List<FuelInformation> loadedInformations = [];
      extractedData.forEach((infoId, infoData) {
        loadedInformations.add(
          FuelInformation(
              id: infoId,
              date: infoData['date'],
              fuelType: infoData['fuelType'],
              quantity: infoData['quantity'],
              unitPrice: infoData['unitPrice'],
              totalPrice: infoData['totalPrice'],
              stationName: infoData['stationName']),
        );
      });
      _items = loadedInformations;
      notifyListeners();
      print(json.decode(response.body));
    } catch (error) {
      throw error;
    }
  }

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
        if (_items[fuelInfoIndex].date == newFuelInfo.date &&
            _items[fuelInfoIndex].fuelType == newFuelInfo.fuelType &&
            _items[fuelInfoIndex].quantity == newFuelInfo.quantity &&
            _items[fuelInfoIndex].stationName == newFuelInfo.stationName &&
            _items[fuelInfoIndex].totalPrice == newFuelInfo.totalPrice &&
            _items[fuelInfoIndex].unitPrice == newFuelInfo.unitPrice) {
          return;
        }
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
    final existingInfoIndex = _items.indexWhere((element) => element.id == id);
    var exisitingInfo = _items[existingInfoIndex];
    _items.removeAt(existingInfoIndex);
    notifyListeners();

    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      _items.insert(existingInfoIndex, exisitingInfo);
      notifyListeners();
      throw HttpException('Could not delete');
    }
  }
}
