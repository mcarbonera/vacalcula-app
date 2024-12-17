import 'package:get/get.dart';
import 'package:vacalcula/bindings/main_bindings.dart';
import 'package:vacalcula/main.dart';

class Routes {

  static String homeRoute = "/home";

  static List<GetPage> getPages() {
    return [
      GetPage(
        name: homeRoute,
        page: () => const MyHomePage(),
        binding: MainBindings()
      )
    ];
  }
}