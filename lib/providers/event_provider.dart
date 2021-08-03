import 'dart:collection';

import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/foundation.dart';

import '../model/fuel_information.dart';

class EventProvider with ChangeNotifier {
  LinkedHashMap<DateTime, List<FuelInformation>>? _events;

  LinkedHashMap<DateTime, List<FuelInformation>>? get getFuelInfoList {
    return _events;
  }

  LinkedHashMap<DateTime, List<FuelInformation>> eventsGenerated(
      List<FuelInformation> fuelInfoList) {
    final Map<DateTime, List<FuelInformation>> _kEventSource = Map.fromIterable(
        fuelInfoList,
        key: (item) {
          if (item.date != null)
            return DateTime.parse(item.date);
          else {
            print('item : ${item.toString()}');
            return DateTime.now();
          }
        },
        value: (item) =>
            getFuelInfoFromDay(DateTime.parse(item.date), fuelInfoList));

    _events = LinkedHashMap<DateTime, List<FuelInformation>>(
      equals: isSameDay,
      hashCode: getHashCode,
    )..addAll(_kEventSource);

    return _events!;
  }

  List<FuelInformation> getFuelInfoFromDay(
      DateTime day, List<FuelInformation> list) {
    final listFromDay = list.where((val) {
      return DateTime.parse(val.date) == day;
    }).toList();
    return listFromDay;
  }

  int getHashCode(DateTime key) {
    return key.day * 1000000 + key.month * 10000 + key.year;
  }
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
