import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class WeightGraphPage extends StatelessWidget {
  final List<WeightData> data = [
    WeightData(DateTime(2024, 04, 15), 567),
    WeightData(DateTime(2024, 04, 16), 785),
    WeightData(DateTime(2024, 04, 17), 667),
    WeightData(DateTime(2024, 04, 18), 967),
    WeightData(DateTime(2024, 04, 19), 587),
    // Add more data points here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weight Graph'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: charts.TimeSeriesChart(
          [
            charts.Series<WeightData, DateTime>(
              id: 'Weight',
              colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
              domainFn: (WeightData data, _) => data.date,
              measureFn: (WeightData data, _) => data.weight,
              data: data,
            ),
          ],
          animate: true,
          dateTimeFactory: const charts.LocalDateTimeFactory(),
        ),
      ),
    );
  }
}

class WeightData {
  final DateTime date;
  final int weight;

  WeightData(this.date, this.weight);
}