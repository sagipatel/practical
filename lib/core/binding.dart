import 'package:get/get.dart';
import 'package:my_projects/core/helper/constant.dart';
import 'package:my_projects/modules/home_module/controllers/home_controller.dart';
import '../modules/home_module/views/home_view.dart';

class Pages {
  static final pages = [
    GetPage(
      name: Routes.homeView,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      }),
    ),
  ];
}
