import 'package:fitnessdashboard/constant/constant.dart';
import 'package:fitnessdashboard/widgets/scheduled_widget.dart';
import 'package:fitnessdashboard/widgets/summary_details.dart';
import 'package:flutter/material.dart';
import 'package:fitnessdashboard/widgets/chart_widget.dart';

class SummaryWidget extends StatelessWidget {
  const SummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Chart(),
            Text("Summary",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            SizedBox(
              height: 16,
            ),
            SummaryDetails(),
            SizedBox(
              height: 40,
            ),
            Scheduled(),
          ],
        ),
      ),
    );
  }
}
