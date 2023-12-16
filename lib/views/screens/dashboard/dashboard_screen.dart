// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:kleen/utils/custom/app_custom_widgets.dart';
import 'package:kleen/views/screens/home/home_screen.dart';
import 'package:kleen/views/screens/map/map_screen.dart';
import '../../../utils/constant/dimensions.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int pageIndex = 0;
  _setPage(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: const [
          HomeScreen(),
          MapScreen()
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColorLight,
        elevation: 0,
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(Dime.PADDING_SIZE_EXTRA_SMALL),
          child: Row(children: [
            BottomNavItem(
                iconData: Icons.home,
                isSelected: pageIndex == 0,
                onTap: () {
                  print("Index 1");
                  _setPage(0);
                }),
            BottomNavItem(
                iconData: Icons.map,
                isSelected: pageIndex == 1,
                onTap: () {
                  print("Index 1");
                  _setPage(1);
                }),
            BottomNavItem(
                iconData: Icons.shopping_basket,
                isSelected: pageIndex == 2,
                onTap: () {
                  print("Index 1");
                  _setPage(2);
                }),
            BottomNavItem(
                iconData: Icons.shopping_bag,
                isSelected: pageIndex == 3,
                onTap: () {
                  print("Index 1");
                  _setPage(3);
                }),
            BottomNavItem(
                iconData: Icons.menu,
                isSelected: pageIndex == 4,
                onTap: () {
                  print("Index 1");
                  _setPage(4);
                }),
          ]),
        ),
      ),
    );
  }
}
