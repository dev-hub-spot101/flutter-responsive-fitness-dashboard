import 'package:fitnessdashboard/util/responsive.dart';
import 'package:fitnessdashboard/widgets/activity_details_card.dart';
import 'package:fitnessdashboard/widgets/bar_chart_widget.dart';
import 'package:fitnessdashboard/widgets/header_widget.dart';
import 'package:fitnessdashboard/widgets/line_chart_card.dart';
import 'package:fitnessdashboard/widgets/summary_widget.dart';
import 'package:flutter/material.dart';

class DashboardWidget extends StatelessWidget {
  const DashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const HeaderWidget(),
            const SizedBox(height: 18),
            const ActivityDetailsCard(),
            const SizedBox(height: 18),
            const LineChartCard(),
            const SizedBox(height: 18),
            const BarGraphCard(),
            const SizedBox(height: 18),
            if (Responsive.isTablet(context)) const SummaryWidget(),
          ],
        ),
      ),
    );
  }
}
