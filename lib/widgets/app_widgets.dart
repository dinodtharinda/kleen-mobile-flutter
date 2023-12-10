import 'package:flutter/material.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
   const PrimaryAppBar(
      {super.key,
       this.title = "",
      this.actions = const [],
      this.leading = const SizedBox(),
      this.fontSize = 17,
      this.fontWeight = FontWeight.w700,

      });
  final String title;
  final List<Widget> actions;
  final Widget leading;
  final double fontSize;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: actions,
      leading: leading,
      elevation: 0,
      title: Text(
        title,
        style: TextStyle(fontWeight: fontWeight, fontSize: fontSize),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
