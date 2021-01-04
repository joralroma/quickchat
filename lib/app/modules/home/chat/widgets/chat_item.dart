import 'package:get/get.dart';
import 'package:flutter/material.dart';

// Models
import 'package:chatquick/app/models/chat.dart';

// Utils
import 'package:chatquick/app/utils/theme.dart';
import 'package:chatquick/app/utils/responsive.dart';
import 'package:chatquick/app/utils/extensions.dart';

class ChatItem extends StatelessWidget {

  final Chat chat;

  const ChatItem({
    Key key,
    @required this.chat
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return GestureDetector(
      onTap: () => Get.toNamed('/chatDetails', arguments: {'user': chat.userChat, 'msms': chat.chats.toMsms}),
      child: Container(
        width: double.infinity,
        height: 60,
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  chat.userChat.imgProfile,
                  fit: BoxFit.cover,
                ),
              )          
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.userChat.nickname.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: QuickTheme.textStyleTitle.copyWith(
                      fontSize: _responsive.ip(1.8),
                      color: QuickTheme.colorTextInput
                    ),
                  ),
                  Text(
                    chat.chats.getLastMsm,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: QuickTheme.textStyleText.copyWith(
                      fontSize: _responsive.ip(1.6),
                      color: QuickTheme.colorTextModal
                    ),
                  ),
                ],
              )
            ),
            Text(
              chat.chats.last?.creationDate?.toDate ?? '',
              style: QuickTheme.textStyleText.copyWith(
                color: QuickTheme.background,
                fontSize: _responsive.ip(1.2)
              ),
            )
          ],
        ),
      ),
    );

  }

}