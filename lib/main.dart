import 'package:flutter/material.dart';
import 'package:obigo_app_project/pages/receipt_history_page.dart';
import 'package:obigo_app_project/providers/event_provider.dart';
import 'package:provider/provider.dart';

import './pages/car_manager_page.dart';
import './pages/scan_receipt_page.dart';
import './pages/fuel_info_page.dart';
import './pages/fuel_report_page.dart';
import './providers/fuel_informations_provider.dart';
import './providers/new_image_provider.dart';
import './providers/new_fuel_information.dart';
import 'providers/statistics_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => FuelInformations(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewImage(),
        ),
        ChangeNotifierProvider(
          create: (_) => NewFuelInformation(),
        ),
        ChangeNotifierProvider(
          create: (_) => Statistics(),
        ),
        ChangeNotifierProvider(
          create: (_) => EventProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'obigo 차계부 app',
        theme: ThemeData(
          primaryColor: Color(0xFF3E3E3E),
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => CarManagerPage(),
          ScanReceiptPage.routeName: (_) => ScanReceiptPage(),
          FuelInfoPage.routeName: (_) => FuelInfoPage(),
          FuelReportPage.routeName: (_) => FuelReportPage(),
          ReceiptHistoryPage.routeName: (_) => ReceiptHistoryPage(),
        },
      ),
    );
  }
}
