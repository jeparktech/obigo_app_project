import 'package:flutter/material.dart';

import '../widget/ImagePicker.dart';

class ScanReceiptPage extends StatelessWidget {
  static const routeName = '/scan-receipt-page';

  //camer button
  openBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ImagePicker();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Scan Receipt',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () => openBottomSheet(context),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16),
          height: 70,
          color: Color(0xFF1AB5E6),
          child: Text(
            "주유 영수증 등록하기",
            style: TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
