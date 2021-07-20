import 'package:flutter/material.dart';

class FuelInfoText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 230,
        width: 350,
        child: Form(
          child: Column(
            children: <Widget>[
              Container(
                width: 330,
                height: 35,
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '주유소명',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      height: 30,
                      child: TextFormField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                width: 330,
                height: 35,
                margin: EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '주유금액',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      height: 30,
                      child: TextFormField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                width: 330,
                height: 35,
                margin: EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '주유단가',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      height: 30,
                      child: TextFormField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                width: 330,
                height: 35,
                margin: EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '주유리터',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      height: 30,
                      child: TextFormField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      )),
                    ),
                  ],
                ),
              ),
              Container(
                width: 330,
                height: 35,
                margin: EdgeInsets.only(bottom: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      '거래일시',
                      style: TextStyle(fontSize: 14),
                    ),
                    Container(
                      width: 250,
                      height: 30,
                      child: TextFormField(
                          decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
