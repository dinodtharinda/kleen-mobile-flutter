import 'package:flutter/material.dart';
import 'package:kleen/utils/custom/app_custom_widgets.dart';

import '../../../utils/constant/dimensions.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int pageIndex = 0;

      
  @override
  Widget build(BuildContext context) {

    _setPage(int index) {
      setState(() {
        pageIndex = index;
      });
    }
    return  Scaffold(
      appBar: const CustomAppBar(
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: CircleAvatar(),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).primaryColorLight,
        elevation: 5,
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        shape: const CircularNotchedRectangle(),
        child: Padding(
          padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
          child: Row(children: [
            BottomNavItem(
                iconData: Icons.home,
                isSelected: pageIndex == 0,
                onTap: () => _setPage(0)),
            BottomNavItem(
                iconData: Icons.favorite,
                isSelected: pageIndex == 1,
                onTap: () => _setPage(1)),

            BottomNavItem(
                iconData: Icons.shopping_cart,
                isSelected: pageIndex == 2,
                onTap: () => _setPage(2)),
         
      
            BottomNavItem(
                iconData: Icons.shopping_bag,
                isSelected: pageIndex == 3,
                onTap: () => _setPage(3)),
            BottomNavItem(
                iconData: Icons.menu,
                isSelected: pageIndex == 4,
                onTap: () {}),
          ]),
        ),
      ),
    );
  }
}
