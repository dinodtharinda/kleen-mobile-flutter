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



const boxShadow = BoxShadow(
  color: CustomColor.customGrey,
  spreadRadius: 1,
  blurRadius: 4,
  offset: Offset(0, 3), // changes position of shadow
);

 Border border = Border.all(width: 0.5, color: CustomColor.lightColor);
              
