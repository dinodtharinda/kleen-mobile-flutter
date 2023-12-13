// ignore_for_file: avoid_print, prefer_function_declarations_over_variables, no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field, dead_code

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../constant/dimensions.dart';
import '../constant/images.dart';
import '../themes/app_colors.dart';
import '../themes/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = "",
    this.actions = const [],
    this.leading = const SizedBox(),
    this.fontWeight = Dimensions.FONT_WEIGHT_DEFAULT,
  });
  final String title;
  final List<Widget> actions;
  final Widget leading;

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
        style: TextStyle(
          fontWeight: Dimensions.FONT_WEIGHT_DEFAULT,
          fontSize: Dimensions.R_FONT_SIZE_LARGE,
        ),
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

class ServiceCard extends StatefulWidget {
  const ServiceCard(
      {super.key,
      required this.title,
      required this.description,
      this.rating = 0,
      this.ratingCount = 0,
      required this.imageUrl});
  final String title;
  final String description;
  final double rating;
  final double ratingCount;
  final String imageUrl;

  @override
  State<ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  bool _isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: CustomColor.lightColor,
          borderRadius: BorderRadius.circular(Dimensions.RADIUS_SMALL),
          boxShadow: [
            BoxShadow(
              color: CustomColor.customGrey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(fit: StackFit.passthrough, children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(Dimensions.RADIUS_SMALL)),
                  child: CustomImage(
                    image: widget.imageUrl,
                    height: 80,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                    right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          _isLiked = !_isLiked;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(
                            Dimensions.PADDING_SIZE_EXTRA_SMALL),
                        decoration: BoxDecoration(
                          color: Theme.of(context).cardColor,
                          borderRadius:
                              BorderRadius.circular(Dimensions.RADIUS_SMALL),
                        ),
                        child: Icon(
                          _isLiked ? Icons.favorite : Icons.favorite_border,
                          size: 15,
                          color: _isLiked
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).disabledColor,
                        ),
                      ),
                    )),
              ]),
              Padding(
                padding: const EdgeInsets.only(
                  right: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                  left: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: robotoMedium.copyWith(
                            fontSize: Dimensions.fontSizeSmall),
                      ),
                      Text(
                        widget.description,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: robotoMedium.copyWith(
                            fontSize: Dimensions.fontSizeExtraSmall,
                            color: Theme.of(context).disabledColor),
                      ),
                      RatingBar(
                        rating: widget.rating,
                        ratingCount: widget.ratingCount,
                        size: 12,
                      ),
                    ]),
              ),
            ]),
      ),
    );
  }
}

class CustomImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final BoxFit fit;
  final bool isNotification;
  const CustomImage(
      {super.key,
      required this.image,
      this.height = 16,
      this.width = 16,
      this.fit = BoxFit.cover,
      this.isNotification = false});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      fit: fit,
      placeholder: (context, url) => Image.asset(
          isNotification ? Images.logo : Images.logo,
          height: height,
          width: width,
          fit: fit),
      errorWidget: (context, url, error) => Image.asset(
          isNotification ? Images.logo : Images.logo,
          height: height,
          width: width,
          fit: fit),
    );
  }
}

class RatingBar extends StatelessWidget {
  final double rating;
  final double size;
  final double ratingCount;
  const RatingBar(
      {super.key,
      required this.rating,
      required this.ratingCount,
      this.size = 18});

  @override
  Widget build(BuildContext context) {
    List<Widget> _starList = [];
    int realNumber = rating.floor();
    int partNumber = ((rating - realNumber) * 10).ceil();

    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        _starList.add(Icon(Icons.star,
            color: Theme.of(context).primaryColor, size: size));
      } else if (i == realNumber) {
        _starList.add(SizedBox(
          height: size,
          width: size,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Icon(Icons.star,
                  color: Theme.of(context).primaryColor, size: size),
              ClipRect(
                clipper: _Clipper(part: partNumber),
                child: Icon(Icons.star, color: Colors.grey, size: size),
              )
            ],
          ),
        ));
      } else {
        _starList.add(Icon(Icons.star, color: Colors.grey, size: size));
      }
    }
    ratingCount > 0
        ? _starList.add(Padding(
            padding: const EdgeInsets.only(
                left: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            child: Text(
              " $ratingCount",
              style: robotoMedium.copyWith(
                  fontSize: Dimensions.fontSizeExtraSmall,
                  color: Theme.of(context).disabledColor),
            ),
          ))
        : const SizedBox();

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _starList,
    );
  }
}

class _Clipper extends CustomClipper<Rect> {
  final int part;
  _Clipper({required this.part});
  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      (size.width / 10) * part,
      0.0,
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
