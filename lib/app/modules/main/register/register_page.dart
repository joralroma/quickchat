import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

// Models
import 'package:chatquick/app/models/error.dart';

// Utils
import 'package:chatquick/app/utils/responsive.dart';

// Widgets
import 'package:chatquick/app/modules/shared/logo.dart';
import 'package:chatquick/app/modules/shared/modal.dart';
import 'package:chatquick/app/modules/shared/input.dart';

// Utils
import 'package:chatquick/app/utils/theme.dart';

// Controller
import 'package:chatquick/app/modules/main/register/register_controller.dart';

class RegsiterPage extends GetView<RegisterController> {

  const RegsiterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Scaffold(
      backgroundColor: QuickTheme.primaryColor,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    QuickLogo(
                      width: _responsive.wp(40),
                      isBorder: false,
                    ),
                    InputItem(
                      controller: controller.userNameController,
                      label: 'Username',
                    ),
                    const SizedBox(height: 30),
                    InputItem(
                      controller: controller.passwordController,
                      isSecure: true,
                      label: 'Password',
                    ),
                    const SizedBox(height: 50),
                    MaterialButton(
                      onPressed: _register,
                      elevation: 8.0,
                      disabledElevation: 8.0,
                      minWidth: _responsive.wp(85),
                      height: 55,
                      color: QuickTheme.bgBtn,
                      disabledColor: QuickTheme.bgBtn,
                      child: Text(
                        'Registrar',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'OpenSasSemiBold',
                          fontSize: _responsive.ip(1.6)
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }



  void _register() async {
    final Modal _modal = Get.find<Modal>();
    _modal.showModalLoader();
    final Either<MyError, bool> result = await controller.doRegister();
    Get.back();
    if(result != null) {
      result.fold(
        (l) => _doError(l.message),
        (r) => _doSuccess()
      );
    }
  }

  void _doError(String text) {
    final Modal _modal = Modal();
    _modal.showSnackbar('¡Error!', text);
  }

  void _doSuccess() {
    Get.back();
    Get.offAllNamed('chat');
  }

}