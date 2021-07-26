import 'package:flutter/material.dart';
import 'package:obigo_app_project/pages/monthly_rh_page.dart';
import 'package:obigo_app_project/widget/calendar.dart';

class ReceiptHistoryPage extends StatelessWidget {
  static const routeName = '/receipt-history-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).popAndPushNamed('/'),
        ),
        centerTitle: true,
        title: Text(
          'Receipt History',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body:
        Calendar(),
        

    );
  }
}
