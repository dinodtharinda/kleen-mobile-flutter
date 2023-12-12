// ignore_for_file: avoid_print, prefer_function_declarations_over_variables, no_leading_underscores_for_local_identifiers, unused_local_variable

import 'package:flutter/material.dart';
import '../constant/dimensions.dart';
import '../themes/app_colors.dart';



class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
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

class CustomButton extends StatelessWidget {
  final Color color;
  final String title;
  final VoidCallback onTap;
  final bool isLoading;
  final bool disabled;
  const CustomButton(
      {super.key,
      this.color = AppColor.primaryColor,
      required this.title,
      required this.onTap,
      this.isLoading = false,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    final Color _lightColor = Theme.of(context).primaryColorLight;
    final Color _darkColor = Theme.of(context).primaryColorLight;

    return GestureDetector(
      onTap: !disabled
          ? onTap
          : () {
              print("Button Disabled!");
            },
      child: Container(
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: MediaQuery.of(context).size.width * 0.11,
        decoration: BoxDecoration(
          color: isLoading || disabled ? color.withOpacity(0.6) : color,
          borderRadius: BorderRadius.circular(
            Dimensions.RADIUS_SMALL,
          ),
        ),
        child: Center(
            child: isLoading
                ? SizedBox(
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

class CustomField extends StatelessWidget {
  const CustomField({super.key});
  @override
  Widget build(BuildContext context) {
    final _sigInFormKey = GlobalKey<FormState>();
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.width * 0.11,
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          contentPadding: EdgeInsetsDirectional.zero,
          prefixIcon: Icon(
            Icons.email,
            size: Dimensions.r_iconSize(context),
          ),
          focusColor: AppColor.primaryColor,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}

class CustomPasswordField extends StatelessWidget {
  const CustomPasswordField({super.key});
  @override
  Widget build(BuildContext context) {
    final _sigInFormKey = GlobalKey<FormState>();
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.width * 0.11,
      child: TextField(
        obscureText: true,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.remove_red_eye_rounded,
            size: Dimensions.r_iconSize(context),
          ),
          contentPadding: EdgeInsetsDirectional.zero,
          prefixIcon: Icon(
            Icons.password,
            size: Dimensions.r_iconSize(context),
          ),
          focusColor: AppColor.primaryColor,
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
