import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:gettest/app/pages/rive/rive_controller.dart';
import 'package:rive/rive.dart';

class RivePage extends StatelessWidget {
  const RivePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<RiveController>(
              id: 'rive',
              builder: (_) {
                return Column(
                  children: [
                    _.loading
                        ? const CircularProgressIndicator()
                        : Expanded(
                            child: Rive(artboard: _.riveArtboard!),
                          ),
                    Obx(() {
                      return Text(_.cups.value.toString());
                    }),
                    CupertinoButton(
                        child: Text('Agregar Vasos'),
                        onPressed: () {
                          if (_.cups.value < 10) {
                            _.cups.value++;
                          } else {
                            _.cups.value = 0;
                          }
                          _.stateAnimated();
                        })
                  ],
                );
              })),
    );
  }
}
