import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_projects/core/custom_widgets/common_widgets.dart';
import 'package:my_projects/core/custom_widgets/custom_app_bar.dart';
import 'package:my_projects/core/helper/custom_colors.dart';
import 'package:my_projects/core/helper/resources.dart';
import 'package:my_projects/core/services/style.dart';
import 'package:my_projects/modules/home_module/controllers/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        color: themeWhiteColor,
        width: GetPlatform.isWeb ? Get.width : null,
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar.appBar(title: "자유톡"),
              Expanded(
                  child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 20),
                child: Column(
                  children: [
                    Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  PngResources.profileIc,
                                  height: 60,
                                  width: 60,
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "  안녕 나 응애",
                                            style: CustomTextStyles.bold(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.w600,
                                              fontColor: themeBlackColor,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 6, right: 6),
                                          child: SvgPicture.asset(
                                              SvgResources.correctIc),
                                        ),
                                        Text(
                                          "1일전",
                                          style: CustomTextStyles.normal(
                                            fontSize: 16.0,
                                            fontColor: themeGrayColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "  165cm  ",
                                            style: CustomTextStyles.normal(
                                              fontSize: 16.0,
                                              fontColor: themeGrayColor,
                                            ),
                                          ),
                                        ),
                                        const CircleAvatar(
                                          backgroundColor: themeGrayColor,
                                          radius: 2,
                                        ),
                                        Flexible(
                                          child: Text(
                                            "  53kg",
                                            style: CustomTextStyles.normal(
                                              fontSize: 16.0,
                                              fontColor: themeGrayColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )),
                                buttonWidget()
                              ],
                            ),
                            const SizedBox(height: 20),
                            titleWidget("지난 월요일에 했던 이벤트 중 가장 괜찮은 상품 뭐야?"),
                            subTitleWidget(
                                ''''지난 월요일에 2023년 S/S 트렌드 알아보기 이벤트 참석했던 팝들아~혹시 어떤 상품이 제일 괜찮았어? 

후기 올라오는거 보면 로우라이즈? 그게 제일 반응 좋고 그 테이블이 제일 재밌었다던데 맞아???

올해 로우라이즈가 트렌드라길래 나도 도전해보고 싶은데 말라깽이가아닌 사람들도 잘 어울릴지 너무너무 궁금해ㅜㅜ로우라이즈 테이블에있었던 팝들 있으면 어땠는지 후기 좀 공유해주라~~!'''),
                            Wrap(
                              spacing: 6,
                              runSpacing: 12,
                              runAlignment: WrapAlignment.spaceAround,
                              children: List.generate(
                                controller.hashTagList.length,
                                (index) => Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22.0),
                                    border: Border.all(color: themeGrayColor),
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xffF7F8FA),
                                        Color(0xffF7F8FA),
                                        Color(0xffCED3DE),
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                  child: Text(
                                    controller.hashTagList[index],
                                    style: CustomTextStyles.medium(
                                        fontSize: 14.0,
                                        fontColor: themeLightGrayColor),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                    Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        CarouselSlider(
                          items: controller.imageSliders,
                          carouselController: controller.carouselCtr,
                          options: CarouselOptions(
                              height: 360,
                              viewportFraction: 1.0,
                              enableInfiniteScroll: false,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              onPageChanged: (index, reason) {
                                controller.current.value = index;
                              }),
                        ),
                        Obx(
                          () => controller.imageSliders!.isEmpty
                              ? const SizedBox.shrink()
                              : DotsIndicator(
                                  position: double.parse(
                                      controller.current.value.toString()),
                                  dotsCount: controller.imageSliders!.length,
                                  decorator: const DotsDecorator(
                                      activeColor: themeWhiteColor,
                                      color: Color(0xff9B9E9F)),
                                ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 12, bottom: 18),
                      child: Row(
                        children: [
                          controller.likeWidget(
                              icon: PngResources.likeIc, count: "4"),
                          const SizedBox(width: 12),
                          controller.otherActionWidget(
                              icon: SvgResources.commentIc, count: 5),
                          const SizedBox(width: 12),
                          controller.otherActionWidget(
                              icon: SvgResources.bookmarkIc),
                          const SizedBox(width: 16),
                          controller.otherActionWidget(
                              icon: SvgResources.moreVertIc),
                        ],
                      ),
                    ),
                    Container(height: 1.5, color: const Color(0xffF7F8FA)),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      itemBuilder: (context, index) {
                        return commentItem(index);
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 20);
                      },
                      itemCount: 2,
                    ),
                    Container(height: 1.5, color: const Color(0xffF7F8FA)),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 12, bottom: 0),
                      child: Row(
                        children: [
                          SvgPicture.asset(SvgResources.imageIc),
                          Expanded(
                            child: Text(
                              "   댓글을 남겨주세요.",
                              style: CustomTextStyles.normal(
                                fontSize: 16.0,
                                fontColor: themeGrayColor,
                              ),
                            ),
                          ),
                          Text(
                            "등록",
                            style: CustomTextStyles.normal(
                              fontSize: 16.0,
                              fontColor: themeGrayColor,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  buttonWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0), color: themeGreenColor),
      child: Text(
        "팔로우",
        style:
            CustomTextStyles.medium(fontSize: 16.0, fontColor: themeWhiteColor),
      ),
    );
  }

  titleWidget(title) {
    return Text(
      title,
      style: CustomTextStyles.bold(
        fontSize: 18.0,
        fontColor: themeBlackColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  subTitleWidget(subTitle) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, bottom: 16),
      child: Text(
        subTitle,
        style: CustomTextStyles.normal(
          fontSize: 14.0,
          fontColor: themeBlackColor,
        ),
      ),
    );
  }

  Widget commentItem(index) {
    return Padding(
      padding: EdgeInsets.only(left: index == 0 ? 0 : 40),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CommonWidgets.commonProfile(
                    iconSize: 40.0,
                    icon: index == 0
                        ? PngResources.profileIc
                        : PngResources.profile2Ic,
                    isChecked: index == 0 ? true : false,
                    name: index == 0 ? "안녕 나 응애" : "ㅇㅅㅇ",
                    status: "1일전"),
              ),
              SvgPicture.asset(SvgResources.moreVertIc)
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48),
            child: Text(
              index == 0
                  ? "어머 제가 있던 테이블이 제일 반응이 좋았나보네요🤭우짤래미님도 아시겠지만 저도 일반인 몸매 그 이상도 이하도아니잖아요?! 그런 제가 기꺼이 도전해봤는데 생각보다괜찮았어요! 오늘 중으로 라이브 리뷰 올라온다고 하니꼭 봐주세용~!"
                  : "오 대박! 라이브 리뷰 오늘 올라온대요? 챙겨봐야겠다",
              style: CustomTextStyles.normal(
                fontColor: themeBlackColor,
                fontSize: 14.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, top: 12),
            child: Row(
              children: [
                controller.likeWidget(icon: PngResources.likeIc, count: "5"),
                const SizedBox(width: 12),
                index == 0
                    ? controller.otherActionWidget(
                        icon: SvgResources.commentIc, count: "5")
                    : const SizedBox.shrink()
              ],
            ),
          )
        ],
      ),
    );
  }
}
