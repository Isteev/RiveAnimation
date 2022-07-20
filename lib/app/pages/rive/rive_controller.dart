import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

class RiveController extends GetxController {
  Artboard? riveArtboard;
  StateMachineController? controller;
  SMIInput<bool>? cups4;
  SMIInput<bool>? cups6;
  SMIInput<bool>? cups8;
  SMIInput<bool>? cups10;

  RxInt cups = 0.obs;
  bool loading = true;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    rootBundle.load('assets/animated_cups.riv').then(
      (data) async {
        // Load the RiveFile from the binary data.
        final file = RiveFile.import(data);

        // The artboard is the root of the animation and gets drawn in the
        // Rive widget.
        final artboard = file.mainArtboard;
        var controller =
            StateMachineController.fromArtboard(artboard, 'State Machine 1');
        if (controller != null) {
          artboard.addController(controller);
          cups4 = controller.findInput('4vasos');
          cups6 = controller.findInput('6vasos');
          cups8 = controller.findInput('8vasos');
          cups10 = controller.findInput('10vasos');
          loading = false;
          update(['rive']);
          stateAnimated();
        }
        riveArtboard = artboard;
      },
    );
  }

  stateAnimated() {
    if (cups.value > 9 || cups.value < 2) {
      cups6?.value = false;
      cups8?.value = false;
      cups10?.value = false;
      cups4?.value = true;
    }

    if (cups.value > 2 && cups.value < 4) {
      cups6?.value = true;
      cups8?.value = false;
      cups10?.value = false;
      cups4?.value = false;
    }

    if (cups.value > 4 && cups.value < 6) {
      cups6?.value = false;
      cups8?.value = true;
      cups10?.value = false;
      cups4?.value = false;
    }

    if (cups.value > 6 && cups.value < 8) {
      cups6?.value = false;
      cups8?.value = false;
      cups10?.value = true;
      cups4?.value = false;
    }
  }
}
