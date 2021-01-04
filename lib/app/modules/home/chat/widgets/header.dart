import 'package:get/get.dart';
import 'package:flutter/material.dart';

// Controller
import 'package:chatquick/app/modules/home/chat/chat_controller.dart';

// Utils
import 'package:chatquick/app/utils/theme.dart';
import 'package:chatquick/app/utils/responsive.dart';

class HeaderChat extends GetView<ChatController> {

  const HeaderChat({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: controller.logout,
          child: Icon(
            Icons.logout,
            color: QuickTheme.colorTextModal,
            size: 26,
          ),
        ),
        Obx(
          () => controller.ready.value ? Text(
            'Chat - ${controller.myData.myUser.nickname}',
            style: QuickTheme.textStyleTitle.copyWith(
              color: QuickTheme.primaryColor,
              fontSize: _responsive.ip(2.0)
            ),
          ) : SizedBox.shrink(),
        ),
        const SizedBox(width: 30)
      ],
    );

  }

}