import 'package:get/get.dart';
import 'package:flutter/material.dart';

// Utils
import 'package:chatquick/app/utils/theme.dart';
import 'package:chatquick/app/utils/responsive.dart';

// User
import 'package:chatquick/app/models/user.dart';

class UserItem extends StatelessWidget {

  final User user;

  const UserItem({
    Key key,
    @required this.user
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return GestureDetector(
      onTap: () => Get.toNamed('/chatDetails', arguments: {'user': user, 'msms': []}),
      child: Container(
        width: 110,
        height: 80,
        margin: EdgeInsets.only(right: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.network(
                  user.imgProfile,
                  fit: BoxFit.cover,
                ),
              ) 
            ),
            Expanded(
              child: Text(
                user.nickname.toUpperCase(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: QuickTheme.textStyleTitle.copyWith(
                  fontSize: _responsive.ip(1.2),
                  color: QuickTheme.colorTextInput
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }

}