import 'package:fitnessdashboard/data/health_details_data.dart';
import 'package:fitnessdashboard/util/responsive.dart';
import 'package:fitnessdashboard/widgets/custom_card_widget.dart';
import 'package:flutter/material.dart';

class ActivityDetailsCard extends StatelessWidget {
  const ActivityDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final healthData = HealthDetailsData().healthData;
    return GridView.builder(
      itemCount: healthData.length,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: Responsive.isMobile(context) ? 2 : 4,
          crossAxisSpacing: Responsive.isMobile(context) ? 12 : 15,
          mainAxisSpacing: 12.0),
      itemBuilder: (context, index) => SizedBox(
        height: Responsive.isMobile(context) ? 120 : 200,
        child: CustomCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                healthData[index].icon,
                width: 30,
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15, bottom: 4),
                child: Text(
                  healthData[index].value,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                healthData[index].title,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    fontWeight: FontWeight.normal),
              )
            ],
          ),
        ),
      ),
    );
  }
}
