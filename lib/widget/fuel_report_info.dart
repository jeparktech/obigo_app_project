import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../providers/monthly_quantity_provider.dart';
import '../providers/fuel_informations_provider.dart';

class FuelReportInfo extends StatefulWidget {
  @override
  _FuelReportInfoState createState() => _FuelReportInfoState();
}

class _FuelReportInfoState extends State<FuelReportInfo> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      final fuelInfos = Provider.of<FuelInformations>(context);
      fuelInfos.fetchAndSetFuelInfos().then((_) {
        Provider.of<MonthlyFuelQuantity>(context, listen: false)
            .addMonthlyQuantity(fuelInfos.items);
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final monthlyFuelQuantity = Provider.of<MonthlyFuelQuantity>(context);
    var monthlyQttData = monthlyFuelQuantity.monthlyQuantityData;
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView(
            children: [
              Container(height: 37),
              Container(
                height: 94,
                color: Color(0xFFDCDCDC),
              ),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(border: Border.all()),
                height: 265,
                child: SfCartesianChart(
                  title: ChartTitle(
                    text: 'Monthly Fuel Fill-ups 단위 L(리터)',
                    textStyle:
                        TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    alignment: ChartAlignment.near,
                  ),
                  series: <CartesianSeries>[
                    ColumnSeries<FuelQuantityData, int>(
                      dataSource: monthlyQttData,
                      xValueMapper: (FuelQuantityData data, _) => data.month,
                      yValueMapper: (FuelQuantityData data, _) => data.quantity,
                      emptyPointSettings:
                          EmptyPointSettings(mode: EmptyPointMode.average),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(border: Border.all()),
                height: 265,
              ),
            ],
          );
  }
}
