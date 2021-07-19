import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/car_manager_page.dart';
import './pages/scan_receipt_page.dart';
import './pages/fuel_info_page.dart';
import './providers/fuel_informations_provider.dart';
import './providers/new_image_provider.dart';

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
      ],
      child: MaterialApp(
        title: 'obigo 차계부 app',
        theme: ThemeData(
          primaryColor: Color(0xFF3E3E3E),
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => CarManagerPage(),
          ScanReceiptPage.routeName: (ctx) => ScanReceiptPage(),
          FuelInfoPage.routeName: (ctx) => FuelInfoPage(),
        },
      ),
    );
  }
}
