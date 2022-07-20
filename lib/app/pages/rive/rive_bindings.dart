import 'package:get/get.dart';
import 'package:gettest/app/pages/rive/rive_controller.dart';

class RiveBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiveController>(() => RiveController());
  }
}
