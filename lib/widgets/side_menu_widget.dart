import 'package:fitnessdashboard/constant/constant.dart';
import 'package:fitnessdashboard/data/sidem_menu_data.dart';
import 'package:fitnessdashboard/model/menu_model.dart';
import 'package:flutter/material.dart';

class SideMenuWidget extends StatefulWidget {
  const SideMenuWidget({super.key});

  @override
  State<SideMenuWidget> createState() => _SideMenuWidgetState();
}

class _SideMenuWidgetState extends State<SideMenuWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = SidemMenuData().menu;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      color: Colors.black,
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) => buildMenuEntry(data[index], index),
      ),
    );
  }

  Widget buildMenuEntry(MenuModel data, int index) {
    final isSelected = selectedIndex == index;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(6.0)),
          color: isSelected ? selectionColor : Colors.transparent),
      child: InkWell(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 7),
              child: Icon(
                data.icon,
                color: isSelected ? Colors.black : Colors.white,
              ),
            ),
            Text(
              data.title,
              style: TextStyle(
                  fontSize: 16,
                  color: isSelected ? Colors.black : Colors.white,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal),
            )
          ],
        ),
      ),
    );
  }
}
