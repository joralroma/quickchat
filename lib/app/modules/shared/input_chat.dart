import 'package:flutter/material.dart';

// utils
import 'package:chatquick/app/utils/theme.dart';
import 'package:chatquick/app/utils/responsive.dart';

class InputChat extends StatelessWidget {

  final TextEditingController controller;
  final int maxLines;
  final TextInputType textInputType;
  final String label;

  const InputChat({
    Key key,
    @required this.controller,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.label = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return TextFormField(
      minLines: 1,
      maxLines: maxLines,
      controller: controller,
      textAlignVertical: (maxLines == 1) ? TextAlignVertical.center : TextAlignVertical.top,
      keyboardType: textInputType,
      style: TextStyle(
        fontSize: _responsive.ip(1.4),
        color: QuickTheme.colorTextInput
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.only(top: 5, right: 15, bottom: 5, left: 15),
        errorStyle: TextStyle(
          fontSize: 0,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: QuickTheme.colorIconInput,
            width: 1.5
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: QuickTheme.colorIconInput,
            width: 1
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5
          ),
        ),
        labelText: label,
        labelStyle: QuickTheme.textStyleText.copyWith(
          color: QuickTheme.colorPlaceholderInput,
          fontSize: _responsive.ip(1.4)
        )         
      ),
    );

  }

}