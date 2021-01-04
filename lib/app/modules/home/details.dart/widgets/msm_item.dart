import 'package:flutter/material.dart';

// Models
import 'package:chatquick/app/models/msm.dart';

// Utils
import 'package:chatquick/app/utils/theme.dart';
import 'package:chatquick/app/utils/responsive.dart';

class MsmItem extends StatelessWidget {

  final Msm msm;

  const MsmItem({
    Key key,
    @required this.msm
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);
  
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: msm.me ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            constraints: BoxConstraints(
              minWidth: 50,
              maxWidth: _responsive.wp(80)
            ),
            decoration: BoxDecoration(
              color: msm.me ? QuickTheme.primaryColor : QuickTheme.bgMsmMe,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: msm.me ? Radius.zero : Radius.circular(20),
                bottomLeft: msm.me ? Radius.circular(20) : Radius.zero,
              )
            ),
            child: Text(
              msm.text,
              style: QuickTheme.textStyleText.copyWith(
                color: msm.me ? Colors.white : QuickTheme.colorTextModal,
                fontSize: _responsive.ip(1.6)
              ),
            ),
          ),
        ],
      ),
    );

  }

}