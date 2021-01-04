import 'package:get/get.dart';
import 'package:flutter/material.dart';

// Utils
import 'package:chatquick/app/utils/theme.dart';
import 'package:chatquick/app/utils/responsive.dart';

// Controller
import 'package:chatquick/app/modules/home/details.dart/details_controller.dart';

class HeaderDetails extends GetView<DetailsController> {

  final String name;

  const HeaderDetails({
    Key key,
    @required this.name
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final Responsive _responsive = Responsive(context);

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(top: 40, right: 20, left: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => Get.back(),
            child: Icon(
              Icons.arrow_back_ios,
              color: QuickTheme.colorTextModal,
              size: 26,
            ),
          ),
          Text(
            name,
            style: QuickTheme.textStyleTitle.copyWith(
              color: QuickTheme.primaryColor,
              fontSize: _responsive.ip(2.0)
            ),
          ),
          const SizedBox(width: 30)
        ],
      ),
    );


  }

}