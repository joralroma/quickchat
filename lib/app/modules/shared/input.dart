import 'package:flutter/material.dart';

// utils
import 'package:chatquick/app/utils/theme.dart';
import 'package:chatquick/app/utils/responsive.dart';

class InputItem extends StatelessWidget {

  final TextEditingController controller;
  final int maxLines;
  final bool isSecure;
  final TextInputType textInputType;
  final bool end = false;
  final String label;

  const InputItem({
    Key key,
    @required this.controller,
    this.maxLines = 1,
    this.isSecure = false,
    this.textInputType = TextInputType.text,
    this.label = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      textAlignVertical: (maxLines == 1) ? TextAlignVertical.center : TextAlignVertical.top,
      obscureText: isSecure,
      keyboardType: textInputType,
      textInputAction: end ? TextInputAction.done : TextInputAction.next,
      style: TextStyle(
        fontSize: _responsive.ip(1.8),
        color: QuickTheme.colorTextInput
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.only(top: 17, right: 50, bottom: 17, left: 17),
        errorStyle: TextStyle(
          fontSize: 0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: QuickTheme.colorIconInput,
            width: 1.5
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: QuickTheme.colorIconInput,
            width: 1
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5
          ),
        ),
        labelText: label,
        labelStyle: QuickTheme.textStyleText.copyWith(
          color: QuickTheme.colorPlaceholderInput,
          fontSize: _responsive.ip(1.8)
        )         
      ),
    );

  }

}