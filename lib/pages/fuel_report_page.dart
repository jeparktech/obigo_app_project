import 'package:flutter/material.dart';

import '../widget/fuel_report_info.dart';

class FuelReportPage extends StatelessWidget {
  static const routeName = 'fuel-report-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Fuel Report',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: FuelReportInfo(),
    );
  }
}
