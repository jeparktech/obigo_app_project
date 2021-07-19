import 'package:flutter/material.dart';
import 'package:obigo_app_project/pages/fuel_info_page.dart';
import 'package:obigo_app_project/pages/scan_receipt_page.dart';

class CarManagerInfo extends StatefulWidget {
 @override
  _CarManagerInfoState createState() => _CarManagerInfoState();
}

class _CarManagerInfoState extends State<CarManagerInfo> {
  @override
  Widget build(BuildContext context) {
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
                child: new Text("Car info", 
                style: TextStyle(color: Colors.black, fontSize: 22),
                textAlign: TextAlign.center,),
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
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                        width: 230,
                        height: 20,
                        child: Text("Fuel Report", 
                        style: TextStyle(
                          color: Color(0xFF1AB5E6), 
                          fontSize: 15, 
                          fontWeight: FontWeight.bold),
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(Icons.navigate_next)),
                    ],
                  ),
                  Container(
                    height: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child : new Icon(Icons.directions_car, color:Color(0xFFDADADA), size: 50),
                        ),
                        Center(
                          child: new Text("No vehicle data history yet", 
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          textAlign: TextAlign.center,),
                        ),
                      ],
                    ),
                  ),
                ],
              ),),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScanReceiptPage()));
                },
                child: Container(
                    height: 130.0,
                    width: 145.0,
                    color: Colors.transparent,
                    child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Color(0xFF8E8E8E)),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                         child : new Icon(Icons.receipt, color:Color(0xFF3E3E3E)),
                        ),
                        Center(
                          child: new Text("Scan Receipt", 
                          style: TextStyle(color: Colors.black, fontSize: 12),
                          textAlign: TextAlign.center,),
                        ),
                      ]
                    ),),
                  ),
              ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 130.0,
                    width: 145.0,
                    color: Colors.transparent,
                    child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.5, color: Color(0xFF8E8E8E)),
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                           child : new Icon(Icons.summarize_outlined, color:Color(0xFF3E3E3E)),
                          ),
                          Center(
                            child: new Text("Receipt History", 
                            style: TextStyle(color: Colors.black, fontSize: 12),
                            textAlign: TextAlign.center,),
                          ),
                        ]
                      )),
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}