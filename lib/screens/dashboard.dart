import 'package:fitnessdashboard/util/responsive.dart';
import 'package:fitnessdashboard/widgets/dashboard_widget.dart';
import 'package:fitnessdashboard/widgets/side_menu_widget.dart';
import 'package:fitnessdashboard/widgets/summary_widget.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = Responsive.isDesktop(context);

    return Scaffold(
      // appBar: !isDesktop
      //     ? AppBar(
      //         title: Text("Dashboard"),
      //       )
      //     : null,
      drawer: !isDesktop
          ? const SizedBox(width: 250, child: SideMenuWidget())
          : null,
      endDrawer: Responsive.isMobile(context)
          ? SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: SummaryWidget())
          : null,
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)
              Expanded(
                flex: 2,
                child: SizedBox(
                  child: SideMenuWidget(),
                ),
              ),
            Expanded(
              flex: 7,
              child: DashboardWidget(),
            ),
            if (isDesktop) Expanded(flex: 3, child: SummaryWidget()),
          ],
        ),
      ),
    );
  }
}
