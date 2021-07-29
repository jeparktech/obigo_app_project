import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/fuel_detail_body.dart';
import '../pages/receipt_history_page.dart';
import '../model/fuel_information.dart';
import '../providers/new_fuel_information.dart';
import '../providers/fuel_informations_provider.dart';

class FuelDetailPage extends StatefulWidget {
  static const routeName = '/fuel-detail-page';

  @override
  _FuelDetailPageState createState() => _FuelDetailPageState();
}

class _FuelDetailPageState extends State<FuelDetailPage> {
  final _form = GlobalKey<FormState>();
  var _isLoading = false;

  Future<void> saveForm() async {
    print('saveForm');
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      FuelInformation fuelInfo =
          Provider.of<NewFuelInformation>(context, listen: false).fuelInfo!;
      await Provider.of<FuelInformations>(context, listen: false)
          .updateFuelInformation(fuelInfo.id, fuelInfo);
    } catch (error) {}
    setState(() {
      _isLoading = false;
    });
    Navigator.of(context).pushReplacementNamed(ReceiptHistoryPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final _fuelInfo =
        ModalRoute.of(context)!.settings.arguments as FuelInformation;
    Provider.of<NewFuelInformation>(context, listen: false)
        .updateFuelInfo(_fuelInfo);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '주유 영수증 상세',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : FuelDetailBody(_form),
      bottomNavigationBar: GestureDetector(
        child: Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(
                      '주유 정보를 수정하시겠습니까?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                      '차계부 데이터에서도 수정됩니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13.0),
                    ),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                          saveForm();
                        },
                        child: Text('예'),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: Text('아니요'),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 0.3)),
                width: MediaQuery.of(context).size.width / 2,
                height: 55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "수정",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text(
                      '주유 영수증을 삭제하시겠습니까?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                    content: Text(
                      '차계부 데이터에서도 삭제됩니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13.0),
                    ),
                    actions: [
                      FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(true);
                          Provider.of<FuelInformations>(context, listen: false)
                              .deleteFuelInformation(_fuelInfo.id)
                              .then((_) {
                            Navigator.of(context).pushReplacementNamed(
                                ReceiptHistoryPage.routeName);
                          });
                        },
                        child: Text('예'),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.of(ctx).pop(false);
                        },
                        child: Text('아니요'),
                      ),
                    ],
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(border: Border.all(width: 0.3)),
                width: MediaQuery.of(context).size.width / 2,
                height: 55,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "삭제",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
