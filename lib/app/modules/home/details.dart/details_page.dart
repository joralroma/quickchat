import 'package:get/get.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

// Models
import 'package:chatquick/app/models/error.dart';

// Shared
import 'package:chatquick/app/modules/shared/modal.dart';

// Utils
import 'package:chatquick/app/utils/theme.dart';
import 'package:chatquick/app/utils/responsive.dart';

// Widgets
import 'package:chatquick/app/modules/shared/input_chat.dart';
import 'package:chatquick/app/modules/home/details.dart/widgets/alert.dart';
import 'package:chatquick/app/modules/home/details.dart/widgets/msm_item.dart';
import 'package:chatquick/app/modules/home/details.dart/widgets/header_details.dart';

// Controller
import 'package:chatquick/app/modules/home/details.dart/details_controller.dart';

class DetailsPage extends GetView<DetailsController> {

  const DetailsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Scaffold(
      backgroundColor: QuickTheme.colorPlaceholderInput,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              HeaderDetails(name: controller.userChat.nickname),
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Obx(
                    () => controller.ready.value ?
                      controller.msms.isEmpty ?
                      QuickAlert(text: 'No tienes mensajes.') :
                      SingleChildScrollView(
                        reverse: true,
                        child: Obx(
                          () => Column(
                            children:   controller.msms.map((e) => MsmItem(msm: e)).toList()
                          ),
                        ),
                      ) : 
                      QuickAlert(text: 'Estamos cargando los mensajes.'),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8.0),
                color: QuickTheme.colorPlaceholderInput,
                child: Row(
                  children: [
                    Expanded(
                      child: InputChat(
                        controller: controller.msmController,
                        maxLines: 3
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).unfocus();
                       _sendMsm();
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        margin: const EdgeInsets.only(left: 15),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: QuickTheme.background
                        ),
                        child: Icon(
                          Icons.send,
                          size: 25,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }


  void _sendMsm() async {
    final Either<MyError, bool> result = await controller.sendMsm();
    if(result != null) {
      result.fold(
        (l) => _doError(l.message),
        (r) => null
      );
    }
  }

  void _doError(String text) {
    final Modal _modal = Get.find<Modal>();
    _modal.showSnackbar('¡Error!', text);
  }



}