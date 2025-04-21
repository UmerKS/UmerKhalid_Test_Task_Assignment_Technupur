import 'package:get/get.dart';
import 'package:umer_khalid/modules/home/views/home_view.dart';

class AppRoutes {
  static const String home = '/home';

  static final pages = [GetPage(name: home, page: () =>  HomeView())];
}
