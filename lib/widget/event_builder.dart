import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/fuel_information.dart';
import '../pages/fuel_detail_page.dart';

class EventBuilder extends StatelessWidget {
  late List<FuelInformation> list;
  int index;
  EventBuilder(this.list, this.index);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4.0,
      ),
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
      child: Row(
        children: <Widget>[
          Container(
            height: 75,
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${DateTime.parse(list[index].date).day}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  '${DateFormat('EEE').format(DateTime.parse(list[index].date))}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            padding: EdgeInsets.all(5),
            height: 80,
            width: 270,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Color(0xFF1AB5E6),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 15),
                  width: 210,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '주유소명 : ${list[index].stationName}',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      Text(
                        '주유량 : ${list[index].quantity}',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      Text(
                        '주유금액 : ${list[index].totalPrice}',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ],
                  ),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(FuelDetailPage.routeName,
                          arguments: list[index]);
                    },
                    icon: Icon(
                      Icons.navigate_next,
                      size: 30,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
