import 'package:flutter/material.dart';
import 'package:obigo_app_project/model/fuel_information.dart';
import 'package:provider/provider.dart';

import '../pages/scan_receipt_page.dart';
import '../pages/fuel_report_page.dart';
import '../pages/receipt_history_page.dart';
import '../providers/fuel_informations_provider.dart';
import '../providers/statistics_provider.dart';

class CarManagerInfo extends StatefulWidget {
  @override
  _CarManagerInfoState createState() => _CarManagerInfoState();
}

class _CarManagerInfoState extends State<CarManagerInfo> {
  var _isLoading = false;
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<FuelInformations>(context).fetchAndSetFuelInfos().then((_) {
        var fuelList =
            Provider.of<FuelInformations>(context, listen: false).items;
        Provider.of<Statistics>(context, listen: false)
            .getDataThisMonth(fuelList);
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final fuelList =
        Provider.of<FuelInformations>(context, listen: false).items;
    final statistics = Provider.of<Statistics>(context, listen: false);
    return Container(
      color: Color(0xFFDCDCDC),
      child: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              height: 150.0,
              width: 300.0,
              color: Colors.transparent,
              child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Color(0xFF8E8E8E)),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  child: new Center(
                    child: new Text(
                      "Space for Car info",
                      style: TextStyle(color: Colors.black, fontSize: 15),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              height: 280.0,
              width: 300.0,
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 0.5, color: Color(0xFF8E8E8E)),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: 20,
                          child: Text(
                            "Fuel Report",
                            style: TextStyle(
                                color: Color(0xFF1AB5E6),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(FuelReportPage.routeName);
                          },
                          icon: Icon(Icons.navigate_next),
                          iconSize: 40,
                        ),
                      ],
                    ),
                    _isLoading
                        ? Container(
                            height: 175,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : fuelList.isEmpty
                            ? Container(
                                height: 140,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: new Icon(Icons.directions_car,
                                          color: Color(0xFFDADADA), size: 50),
                                    ),
                                    Center(
                                      child: new Text(
                                        "No vehicle data history yet",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                height: 175,
                                //decoration: BoxDecoration(border: Border.all()),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 30, vertical: 5),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Monthly Fuel Fill-ups'),
                                        Text(
                                          '${statistics.qttThisMonth.toStringAsFixed(3)}L',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Monthly Fuel Costs'),
                                        Text(
                                          '${statistics.totalCostThisMonth}원',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ScanReceiptPage.routeName);
                },
                child: Container(
                  height: 130.0,
                  width: 145.0,
                  color: Colors.transparent,
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 0.5, color: Color(0xFF8E8E8E)),
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: new Icon(Icons.receipt,
                                color: Color(0xFF3E3E3E)),
                          ),
                          Center(
                            child: new Text(
                              "Scan Receipt",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
              SizedBox(width: 20),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, ReceiptHistoryPage.routeName);
                },
                child: Container(
                  height: 130.0,
                  width: 145.0,
                  color: Colors.transparent,
                  child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 0.5, color: Color(0xFF8E8E8E)),
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                              child: new Icon(Icons.summarize_outlined,
                                  color: Color(0xFF3E3E3E)),
                            ),
                            Center(
                              child: new Text(
                                "Receipt History",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 12),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ])),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
