import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './pages/starting_page.dart';
import './pages/receipt_scan_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [],
      child: MaterialApp(
        title: 'obigo 차계부 app',
        initialRoute: '/',
        routes: {
          '/': (ctx) => StartingPage(),
          ReceiptScanPage.routeName: (ctx) => ReceiptScanPage(),
        },
      ),
    );
  }
}
