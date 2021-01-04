import 'package:flutter/material.dart';

// Utils
import 'package:chatquick/app/utils/theme.dart';
import 'package:chatquick/app/utils/responsive.dart';

class AlertEmpty extends StatelessWidget {
  
  final String text;

  const AlertEmpty({
    Key key,
    this.text = ''
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Container(
      margin: const EdgeInsets.only(top: 100),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: QuickTheme.textStyleTitle.copyWith(
          fontSize: _responsive.ip(2.8),
          color: QuickTheme.background
        ),
      ),
    );
  }

}