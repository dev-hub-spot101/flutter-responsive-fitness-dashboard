import 'package:fitnessdashboard/constant/constant.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartData {
  final paiChartSelectionDatas = [
    PieChartSectionData(
      color: primaryColor,
      value: 25,
      showTitle: false,
      radius: 25,
    ),
    PieChartSectionData(
      color: const Color(0xFF26E5FF),
      value: 20,
      showTitle: false,
      radius: 21,
    ),
    PieChartSectionData(
      color: const Color(0xFFFFCF26),
      value: 08,
      showTitle: false,
      radius: 18,
    ),
    PieChartSectionData(
      color: const Color(0xFFEE2727),
      value: 12,
      showTitle: false,
      radius: 14,
    ),
    PieChartSectionData(
      color: primaryColor.withOpacity(0.1),
      value: 25,
      showTitle: false,
      radius: 12,
    ),
  ];
}
