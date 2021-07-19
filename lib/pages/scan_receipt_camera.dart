import 'package:flutter/material.dart';

class ScanReceiptCamPage extends StatefulWidget {
 @override
  _ScanReceiptCamPageState createState() => _ScanReceiptCamPageState();
}

class _ScanReceiptCamPageState extends State<ScanReceiptCamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          title: Text('Scan Receipt',
            style: TextStyle(color: Colors.white,fontSize: 16),
          ),
      ),
    );
  }
}