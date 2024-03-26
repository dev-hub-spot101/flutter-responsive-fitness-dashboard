import 'package:fitnessdashboard/constant/constant.dart';
import 'package:fitnessdashboard/data/line_data.dart';
import 'package:fitnessdashboard/widgets/custom_card_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartCard extends StatelessWidget {
  const LineChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = LineData();
    return CustomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Steps Overview",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          AspectRatio(
            aspectRatio: 16 / 6,
            child: LineChart(LineChartData(
                lineTouchData: LineTouchData(handleBuiltInTouches: true),
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  rightTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles:
                      AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            return data.bottomTitle[value.toInt()] != null
                                ? SideTitleWidget(
                                    child: Text(
                                      data.bottomTitle[value.toInt()]
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.black87),
                                    ),
                                    axisSide: meta.axisSide)
                                : SizedBox();
                          })),
                  leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      return data.leftTitle[value.toInt()] != null
                          ? SideTitleWidget(
                              child: Text(
                                data.leftTitle[value.toInt()].toString(),
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black87),
                              ),
                              axisSide: meta.axisSide)
                          : SizedBox();
                    },
                    interval: 1,
                    reservedSize: 40,
                  )),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  LineChartBarData(
                      color: selectionColor,
                      barWidth: 2.5,
                      belowBarData: BarAreaData(
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                selectionColor.withOpacity(0.5),
                                Colors.transparent
                              ]),
                          show: true),
                      dotData: FlDotData(show: false),
                      spots: data.spots)
                ],
                minX: 0,
                maxY: 106,
                maxX: 120,
                minY: -5)),
          )
        ],
      ),
    );
  }
}
