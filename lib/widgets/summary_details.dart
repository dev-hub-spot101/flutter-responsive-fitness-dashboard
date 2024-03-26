import 'package:fitnessdashboard/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class SummaryDetails extends StatelessWidget {
  const SummaryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      color: const Color(0xFF2F353E),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildDetails('Cal', '305'),
          buildDetails('Steps', '13098'),
          buildDetails('Distance', '8.04Km'),
          buildDetails('Sleep', '7hr')
        ],
      ),
    );
  }

  Widget buildDetails(String key, String value) {
    return Column(
      children: [
        Text(
          key,
          style: TextStyle(fontSize: 11, color: Colors.white),
        ),
        SizedBox(
          height: 2,
        ),
        Text(
          value,
          style: TextStyle(fontSize: 14, color: Colors.white70),
        ),
      ],
    );
  }
}
