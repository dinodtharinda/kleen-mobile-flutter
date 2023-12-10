// ignore_for_file: avoid_print, prefer_function_declarations_over_variables, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import 'package:kleen/utils/app_colors.dart';
import 'package:kleen/utils/dimensions.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryAppBar({
    super.key,
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




class PrimaryAppButton extends StatelessWidget {
  

  final Color color;
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  const PrimaryAppButton(
      {super.key,
      this.color = AppColor.primaryColor,
      required this.title,
      required this.onTap,
      this.isLoading = false});

   
  @override
  Widget build(BuildContext context) {
       final Color _lightColor = Theme.of(context).primaryColorLight;
       final Color _darkColor = Theme.of(context).primaryColorLight;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.12,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            Dimensions.RADIUS_SMALL,
          ),
        ),
        child: Center(
            child: isLoading
                ?  SizedBox(
                    width: 25,
                    height: 25,
                    child: CircularProgressIndicator(
                      color: _lightColor,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    title,
                    style: TextStyle(
                        color: _lightColor,
                        fontSize: Dimensions.FONT_SIZE_BUTTON,
                        fontWeight: FontWeight.w500),
                  )),
      ),
    );
  }
}
