import 'package:get/get.dart';
import 'package:gettest/app/pages/home/home_bindings.dart';
import 'package:gettest/app/pages/home/home_page.dart';
import 'package:gettest/app/pages/rive/rive_bindings.dart';
import 'package:gettest/app/pages/rive/rive_page.dart';

part './appRoutes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.createProduct,
        page: () => const Home(),
        binding: HomeBindigs()),
    GetPage(
        name: Routes.rivePage,
        page: () => const RivePage(),
        binding: RiveBindings())
  ];
}
