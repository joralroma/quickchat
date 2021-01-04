import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

// Widgets
import 'package:chatquick/app/modules/shared/logo.dart';

// Utils
import 'package:chatquick/app/utils/theme.dart';
import 'package:chatquick/app/utils/responsive.dart';

// Controller
import 'package:chatquick/app/modules/main/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {

  const SplashPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Scaffold(
      backgroundColor: QuickTheme.primaryColor,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ZoomIn(
              duration: const Duration(seconds: 2),
              child: QuickLogo(
                width: _responsive.wp(50),
              )
            ),
          ],
        ),
      ),
    );

  }

}