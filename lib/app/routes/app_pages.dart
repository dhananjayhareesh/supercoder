import 'package:get/get.dart';
import '../../view/HomePage/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = Routes.home;

  static final routes = <GetPage>[
    GetPage(name: Routes.home, page: () => const HomeView()),
  ];
}
