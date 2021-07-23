import 'package:flutter/material.dart';
import 'package:obigo_app_project/pages/monthly_rh_page.dart';
import 'package:obigo_app_project/widget/calendar.dart';

class ReceiptHistoryPage extends StatelessWidget {
  static const routeName = '/receipt-history-page';

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Receipt History',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: Column(
        children: [
          Container(
          margin: EdgeInsets.all(10),
          height: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 270,),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(MonthlyRHPage.routeName);
                }, 
                icon: Icon(Icons.list, size: 35, color: Color(0xFFC4C4C4),)
              ),
              IconButton(
                onPressed: () {}, 
                icon: Icon(Icons.calendar_today_rounded, size: 30, color: Color(0xFF1AB5E6),)
              ),
            ],
          ),
        ),
        Calendar(),
        ],
      ),
    );
  }
}