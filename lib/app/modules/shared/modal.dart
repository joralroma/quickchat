import 'dart:ui';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// Utils
import 'package:chatquick/app/utils/theme.dart';
import 'package:chatquick/app/utils/responsive.dart';

// Widgets
import 'package:chatquick/app/modules/shared/logo.dart';

class Modal {

  Responsive _responsive;

  void showSnackbar(String title, String msm) {
    _responsive = Responsive(Get.context);
    Get.snackbar(
      title,
      msm,
      backgroundColor: Colors.red,
      messageText: Text(
        msm,
        style: QuickTheme.textStyleTitle.copyWith(
          color: Colors.white,
          fontSize: _responsive.ip(1.6)
          // fontSize: 18
        ),
      ),
      titleText: Text(
        title,
        style: QuickTheme.textStyleTitle.copyWith(
          color: Colors.white,
          fontSize: _responsive.ip(2.0)
          // fontSize: 22
        ),
      )
    );
  }

  void showModalLoader() {
    showCupertinoDialog(
      context: Get.context,
      builder: (context) => WillPopScope(
        onWillPop: () async => false,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: QuickTheme.primaryColor,
                    // color: Colors.white.withOpacity(0.8),
                  ),
                ),
              ),
            ),          
            Center(child: QuickLogo())
          ],
        ),
      ),
    );
  }


}