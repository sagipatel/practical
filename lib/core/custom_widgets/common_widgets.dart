import 'package:flutter/material.dart';
import 'package:my_projects/core/helper/custom_colors.dart';
import 'package:my_projects/core/helper/resources.dart';
import 'package:my_projects/core/services/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonWidgets {
  static commonProfile({icon, name, status, isChecked = true, iconSize}) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: iconSize ?? 60,
          width: iconSize ?? 60,
        ),
        Flexible(
          child: Text(
            "  $name",
            style: CustomTextStyles.bold(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              fontColor: themeBlackColor,
            ),
          ),
        ),
        isChecked
            ? Padding(
                padding: const EdgeInsets.only(left: 6, right: 6),
                child: SvgPicture.asset(SvgResources.correctIc),
              )
            : SizedBox(width: 8),
        Text(
          "$status",
          style: CustomTextStyles.normal(
            fontSize: 16.0,
            fontColor: themeGrayColor,
          ),
        ),
      ],
    );
  }
}
