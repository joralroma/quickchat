import 'dart:math' as math;

import 'package:flutter/cupertino.dart';

class Responsive {

  double width, height, inch;

  EdgeInsets padding;

  Responsive(BuildContext context) {

    final MediaQueryData data = MediaQuery.of(context);
    final Size size = data.size;

    width = size.width;
    height = size.height;

    inch = math.sqrt(math.pow(width, 2) + math.pow(height, 2));

    padding = data.padding;

  }

  double wp(double percent) {
    return width * percent / 100;
  }


  double hp(double percent) {
    return height * percent / 100;
  }


  double ip(double percent) {
    return inch * percent / 100;
  }

}
