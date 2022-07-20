import 'package:get/instance_manager.dart';
import 'package:gettest/app/pages/home/home_controller.dart';

class HomeBindigs implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeCotroller>(() => HomeCotroller());
  }
}
