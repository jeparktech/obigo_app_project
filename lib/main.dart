import 'package:flutter/material.dart';
import 'package:obigo_app_project/pages/car_manager_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'obigo 차계부 app',
      theme: ThemeData(
        primaryColor: Color(0xFF3E3E3E),
      ),
      initialRoute: '/',
      routes: {
        '/': (ctx) => CarManagerPage(),
      },
    );
  }
}
