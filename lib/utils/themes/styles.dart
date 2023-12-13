import 'package:flutter/material.dart';
import 'colors.dart';

import '../constant/dimensions.dart';

TextStyle textStyleDefault(BuildContext context) {
  return TextStyle(
     fontFamily: "Roboto",
    fontWeight: Dimensions.FONT_WEIGHT_DEFAULT,
    fontSize: Dimensions.R_FONT_SIZE_DEFAULT(context),
  );
}


TextStyle textStyleSmall(BuildContext context) {
  return TextStyle(
     fontFamily: "Roboto",
    fontWeight: Dimensions.FONT_WEIGHT_DEFAULT,
    fontSize: Dimensions.R_FONT_SIZE_SMALL(context),
  );
}
TextStyle textStyleLarge(BuildContext context) {
  return TextStyle(
    fontFamily: "Roboto",
    fontWeight: Dimensions.FONT_WEIGHT_DEFAULT,
    fontSize: Dimensions.R_FONT_SIZE_LARGE(context),
  );
}



final boxShadow = BoxShadow(
  color: CustomColor.customGrey.withOpacity(0.3),
  spreadRadius: 2,
  blurRadius: 5,
  offset: const Offset(0, 3), // changes position of shadow
);
