import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../providers/statistics_provider.dart';
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
        Provider.of<Statistics>(context, listen: false)
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
    final statistics = Provider.of<Statistics>(context);
    var monthlyQttData = statistics.monthlyQuantityData;
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  width: 600,
                  padding: EdgeInsets.all(8),
                  //decoration: BoxDecoration(border: Border.all()),
                  height: 265,
                  child: SfCartesianChart(
                    title: ChartTitle(
                      text: 'Monthly Fuel Fill-ups 단위 L(리터)',
                      textStyle:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      alignment: ChartAlignment.near,
                    ),
                    primaryXAxis: CategoryAxis(
                      majorGridLines: MajorGridLines(width: 0),
                      axisLine: AxisLine(
                        color: Color(0xFF1AB5E6),
                        width: 2,
                      ),
                    ),
                    // primaryYAxis: CategoryAxis(
                    //   majorGridLines: MajorGridLines(width: 0),
                    //   axisLine: AxisLine(
                    //     color: Color(0xFF1AB5E6),
                    //     width: 2,
                    //   ),
                    // ),
                    series: <CartesianSeries>[
                      ColumnSeries<FuelQuantityData, int>(
                        color: Color(0xFF1AB5E6),
                        dataSource: monthlyQttData,
                        xValueMapper: (FuelQuantityData data, _) => data.month,
                        yValueMapper: (FuelQuantityData data, _) =>
                            data.quantity,
                        width: 0.5,
                        emptyPointSettings:
                            EmptyPointSettings(mode: EmptyPointMode.average),
                        dataLabelSettings: DataLabelSettings(
                            isVisible: true,
                            textStyle: TextStyle(
                                fontSize: 10, color: Color(0xFF1AB5E6))),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(),
              Container(
                //decoration: BoxDecoration(border: Border.all()),
                height: 265,
              ),
            ],
          );
  }
}
