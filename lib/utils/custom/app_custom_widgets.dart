// ignore_for_file: avoid_print, prefer_function_declarations_over_variables, no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field

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
      this.color = CustomColor.primaryColor,
      required this.title,
      required this.onTap,
      this.isLoading = false,
      this.disabled = false});

  @override
  Widget build(BuildContext context) {
    final Color _lightColor = Theme.of(context).primaryColorLight;
    final Color _darkColor = Theme.of(context).primaryColorDark;

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
                        fontSize: Dimensions.R_FONT_SIZE_DEFAULT(context),
                        fontWeight: FontWeight.w500),
                  )),
      ),
    );
  }
}

class CustomField extends StatefulWidget {
  const CustomField(
      {super.key, required this.controller, this.hint = "", this.icon});

  final TextEditingController controller;
  final String hint;
  final IconData? icon;

  @override
  State<CustomField> createState() => _CustomFieldState();
}

class _CustomFieldState extends State<CustomField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color _lightColor = Theme.of(context).primaryColorLight;
    final Color _darkColor = Theme.of(context).primaryColorDark;
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.width * 0.11,
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
            color: _darkColor,
            fontWeight: Dimensions.FONT_WEIGHT_DEFAULT,
            fontSize: Dimensions.R_FONT_SIZE_DEFAULT(context)),
        cursorColor: CustomColor.customGrey,
        cursorWidth: 0.9,
        decoration: InputDecoration(
          filled: true,
          fillColor: CustomColor.customGrey.withOpacity(0.154),
          hintText: widget.hint,
          hintStyle: const TextStyle(
              color: CustomColor.customGrey,
              fontWeight: Dimensions.FONT_WEIGHT_SMALL),
          contentPadding: EdgeInsetsDirectional.zero,
          prefixIconColor:
              // _isFocused ? CustomColor.primaryColor :
              CustomColor.customGrey,
          prefixIcon: Icon(
            widget.icon,
            size: Dimensions.R_ICON_SIZE(context),
          ),
          focusColor: CustomColor.primaryColor,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.customGrey, width: 1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.customGrey, width: 1),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.customGrey, width: 2),
          ),
        ),
      ),
    );
  }
}

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField(
      {super.key, required this.controller, this.hint = "", this.icon});

  final TextEditingController controller;
  final String hint;
  final IconData? icon;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;
  bool _showPassword = false;
  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color _lightColor = Theme.of(context).primaryColorLight;
    final Color _darkColor = Theme.of(context).primaryColorDark;
    return Container(
      margin: const EdgeInsets.all(10),
      height: MediaQuery.of(context).size.width * 0.11,
      child: TextField(
        controller: widget.controller,
        focusNode: _focusNode,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
            color: _darkColor,
            fontWeight: Dimensions.FONT_WEIGHT_DEFAULT,
            fontSize: Dimensions.R_FONT_SIZE_DEFAULT(context)),
        cursorColor: CustomColor.customGrey,
        cursorWidth: 0.9,
        obscureText: !_showPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: CustomColor.customGrey.withOpacity(0.154),
          hintText: widget.hint,
          hintStyle: const TextStyle(
              color: CustomColor.customGrey,
              fontWeight: Dimensions.FONT_WEIGHT_SMALL),
          contentPadding: EdgeInsetsDirectional.zero,
          prefixIconColor:
              // _isFocused ? CustomColor.primaryColor :
              CustomColor.customGrey,
          prefixIcon: Icon(
            widget.icon,
            size: Dimensions.R_ICON_SIZE(context),
          ),
          focusColor: CustomColor.primaryColor,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.customGrey, width: 1),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.customGrey, width: 1),
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: CustomColor.customGrey, width: 2),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _showPassword ? Icons.visibility : Icons.visibility_off,
              size: Dimensions.R_ICON_SIZE(context),
              color: CustomColor.customGrey,
            ),
            onPressed: () {
              setState(() {
                _showPassword = !_showPassword;
              });
            },
          ),
        ),
      ),
    );
  }
}



//hello
