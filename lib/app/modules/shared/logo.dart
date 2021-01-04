import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';

class QuickLogo extends StatelessWidget {

  final double width;
  final double paddingVertical;
  final double paddingHorizontal;
  final bool isBorder;

  const QuickLogo({
    Key key,
    this.width = 100,
    this.paddingVertical = 50,
    this.paddingHorizontal = 20,
    this.isBorder = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(vertical: paddingVertical, horizontal: paddingHorizontal),
      decoration: BoxDecoration(
        border: isBorder ? Border.all(
          width:  1,
          color: Colors.white
        ) : null,
        borderRadius: BorderRadius.circular(20)
      ),
      child: SvgPicture.asset(
        'assets/imgs/logo.svg',
        width: width,
      ),
    );

  }

}