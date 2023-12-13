import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/dimensions.dart';

final textStyleDefault = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: Dimensions.FONT_WEIGHT_DEFAULT,
    fontSize: Dimensions.R_FONT_SIZE_DEFAULT,
    color: Get.theme.primaryColorDark);

final textStyleSmall = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: Dimensions.FONT_WEIGHT_DEFAULT,
  fontSize: Dimensions.R_FONT_SIZE_SMALL,
);

final textStyleLarge = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: Dimensions.FONT_WEIGHT_DEFAULT,
    fontSize: Dimensions.R_FONT_SIZE_LARGE,
    color: Get.theme.primaryColorDark);

final boxShadow = BoxShadow(
  color: Get.theme.primaryColorDark.withOpacity(0.3),
  spreadRadius: 2,
  blurRadius: 5,
  offset: const Offset(0, 3), // changes position of shadow
);
