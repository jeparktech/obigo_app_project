import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:obigo_app_project/model/fuel_information.dart';


import 'package:obigo_app_project/providers/event_provider.dart';
import 'package:obigo_app_project/providers/fuel_informations_provider.dart';
import 'package:obigo_app_project/widget/event_builder.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';


class Calendar extends StatefulWidget {
  @override
  _CalenderState createState() => _CalenderState();
}

class _CalenderState extends State<Calendar> {
  bool listPageOn = false;
  late final ValueNotifier<List<FuelInformation>> _selectedEvents;
  late final ValueNotifier<List<FuelInformation>> _selectedMonthlyEvents;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = DateTime.now();
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      final fuelInfos = Provider.of<FuelInformations>(context);
      fuelInfos.fetchAndSetFuelInfos().then((_) {
        Provider.of<EventProvider>(context, listen: false)
            .eventsGenerated(fuelInfos.items);
        setState(() {
          _selectedDay = _focusedDay;
          _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));
          _isLoading = false;
        });
      });
    }
    setState(() {
               _selectedMonthlyEvents = ValueNotifier(_getEventsForMonth(_focusedDay));
    });
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _selectedEvents.dispose();
    super.dispose();
  }

  List<FuelInformation> _getEventsForDay(DateTime day) {
    final FuelInfo = Provider.of<EventProvider>(context, listen: false);
    var FuelInfoData = FuelInfo.getFuelInfoList;
    // Implementation example
    return FuelInfoData![day] ?? [];
  }

  List<FuelInformation> _getEventsForMonth(DateTime day) {
    final FuelInfo = Provider.of<EventProvider>(context, listen: false);
    var FuelInfoData = FuelInfo.getFuelInfoList;

    List<FuelInformation> monthlyList = [];
    DateTime createdDate;
    FuelInfoData!.keys.forEach((k) {
      if (k.year == day.year && k.month == day.month) {
        monthlyList.addAll(FuelInfoData[k]!);
      }
     });
    return monthlyList;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
      _selectedEvents.value = _getEventsForDay(selectedDay);
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading? Center(child: CircularProgressIndicator(),) :
    Column(
      children: <Widget> [
         Container(
           child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 270,),
                IconButton(
                  onPressed: () {
                    setState(() {
                      listPageOn = true;
                    });
                    print("true");
                  }, 
                  icon: Icon(Icons.list, size: 40, color: listPageOn ? Color(0xFF1AB5E6) : Color(0xFFC4C4C4),)
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      listPageOn = false;
                    });
                    print("false");
                  }, 
                  icon: Icon(Icons.calendar_today_rounded, size: 30, color: listPageOn ? Color(0xFFC4C4C4): Color(0xFF1AB5E6) )
                ),
              ],
            ),
         ),
    
      listPageOn? _buildMontlyEventList() : tableCalendar(),
 //   _buildMontlyEventList(),
        ],
    );
  }

  Widget _buildMontlyEventList() {
    return Container(
      height: 610,
      child:  ValueListenableBuilder<List<FuelInformation>>(
        valueListenable: _selectedMonthlyEvents,
          builder: (context, value, _) {
            return ListView.builder(
              itemCount: value.length,
              itemBuilder: (context, index) {
                return EventBuilder(value, index);
              },
            );
          },
        ),
    );
  }
  

  Widget tableCalendar() {
    return Container(
      height: 610,
      child: Column(
        children: [
          Container(
            child: TableCalendar(
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Color(0xFF1AB5E6),
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  shape: BoxShape.circle,
                ),
              ),

              headerStyle: HeaderStyle(
                titleCentered: true,
                titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                formatButtonVisible: false,
              ),

              firstDay: kFirstDay,
              lastDay: kLastDay,
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat,
              onDaySelected: _onDaySelected,
              eventLoader: _getEventsForDay,
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
            ),
          ),
          const Divider(
            color: Color(0xFFDCDCDC),
            height: 2.5,
            thickness: 2,
            endIndent: 0,
          ), 
          const SizedBox(height: 8.0),
          Expanded(
            child: ValueListenableBuilder<List<FuelInformation>>(
              valueListenable: _selectedEvents,
              builder: (context, value, _) {
                return ListView.builder(
                  itemCount: value.length,
                  itemBuilder: (context, index) {
                    return EventBuilder(value, index);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
