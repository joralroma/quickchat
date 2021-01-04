import 'package:flutter/material.dart';

// Utils
import 'package:chatquick/app/utils/theme.dart';
import 'package:chatquick/app/utils/responsive.dart';

class QuickAlert extends StatelessWidget {

  final String text;

  const QuickAlert({
    Key key,
    this.text = ''
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Center(
      child: Text(
        text,
        style: QuickTheme.textStyleTitle.copyWith(
          color: QuickTheme.colorPlaceholderInput,
          fontSize: _responsive.ip(2.2)
        ),
      )
    );

  }

}