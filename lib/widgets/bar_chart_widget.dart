import 'package:fitnessdashboard/data/bar_graph_data.dart';
import 'package:fitnessdashboard/model/graph_model.dart';
import 'package:fitnessdashboard/util/responsive.dart';
import 'package:fitnessdashboard/widgets/custom_card_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraphCard extends StatelessWidget {
  const BarGraphCard({super.key});

  @override
  Widget build(BuildContext context) {
    final barGraphData = BarGraphData();
    return GridView.builder(
      itemCount: barGraphData.data.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 1 : 3,
          crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
          mainAxisSpacing: 12.0),
      itemBuilder: (context, index) {
        return SizedBox(
          height: 200,
          child: CustomCard(
            padding: EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    barGraphData.data[index].label,
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: BarChart(BarChartData(
                      barGroups: _chatGroups(
                          points: barGraphData.data[index].graph,
                          color: barGraphData.data[index].color),
                      borderData: FlBorderData(border: Border()),
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              return Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  barGraphData.label[value.toInt()],
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500),
                                ),
                              );
                            },
                          )),
                          leftTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          topTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false)),
                          rightTitles: AxisTitles(
                              sideTitles: SideTitles(showTitles: false))))),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  List<BarChartGroupData> _chatGroups(
      {required List<GraphModel> points, required Color color}) {
    return points
        .map((point) => BarChartGroupData(x: point.x.toInt(), barRods: [
              BarChartRodData(
                  toY: point.y,
                  width: 12,
                  color: color.withOpacity(point.y.toInt() > 4 ? 1 : 0.4),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(3.0),
                      topRight: Radius.circular(3.0)))
            ]))
        .toList();
  }
}
