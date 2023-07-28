import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_projects/core/helper/custom_colors.dart';
import 'package:my_projects/core/helper/resources.dart';
import 'package:my_projects/core/services/style.dart';

class CustomAppBar {
  static appBar({title, Function? onBackPress}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20.0),
      child: Row(
        children: [
          InkWell(
              onTap: () {
                if (onBackPress == null) {
                  Get.back();
                } else {
                  onBackPress();
                }
              },
              child: SvgPicture.asset(SvgResources.backIc)),
          Expanded(
            child: Text(
              title,
              style: CustomTextStyles.medium(
                fontSize: 22.0,
                fontColor: themeBlackColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SvgPicture.asset(SvgResources.notificationIc),
        ],
      ),
    );
  }
}
