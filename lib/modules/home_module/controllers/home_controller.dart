import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:my_projects/core/helper/custom_colors.dart';
import 'package:my_projects/core/helper/resources.dart';
import 'package:my_projects/core/services/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeController extends GetxController {
  var images = [
    "https://wjddnjs754.cafe24.com/web/product/small/202303/5b9279582db2a92beb8db29fa1512ee9.jpg",
    "https://wjddnjs754.cafe24.com/web/product/small/202303/5b9279582db2a92beb8db29fa1512ee9.jpg"
  ];
  CarouselController carouselCtr = CarouselController();
  var current = 0.obs;
  void onInit() {
    imageSliders!.value = images
        .map((item) => InkWell(
              onTap: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      item,
                    ),
                  ),
                ),
              ),
            ))
        .toList();
    super.onInit();
  }

  var hashTagList = [
    "#2023",
    "#TODAYISMONDAY",
    "#TOP",
    "#POPS!",
    "#WOW",
    "#ROW",
  ];

  RxList<Widget>? imageSliders = <Widget>[].obs;

  likeWidget({icon, count}) {
    return Row(
      children: [
        Image.asset(icon, height: 22),
        Text(
          "  $count",
          style: CustomTextStyles.medium(
              fontSize: 14.0, fontColor: themeGrayColor),
        )
      ],
    );
  }

  otherActionWidget({icon, count}) {
    return Row(
      children: [
        SvgPicture.asset(icon),
        count == null
            ? SizedBox.shrink()
            : Text(
                " $count",
                style: CustomTextStyles.medium(
                    fontSize: 14.0, fontColor: themeGrayColor),
              )
      ],
    );
  }
}
