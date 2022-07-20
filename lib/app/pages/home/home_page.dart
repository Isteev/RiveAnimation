import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gettest/app/pages/home/home_controller.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<HomeCotroller>(
              id: 'places',
              builder: (_) {
                return Column(
                  children: [
                    CupertinoTextField(
                      controller: _.search,
                    ),
                    Expanded(
                      child: ListView(
                        children: List.generate(_.resta.length, (int) {
                          return Container(
                            decoration: BoxDecoration(color: Colors.green),
                            padding: EdgeInsets.all(20),
                            margin: EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                Text(_.resta[int].name ?? ''),
                                Text(_.resta[int].geometry!.location!.lat
                                    .toString()),
                                Text(_.resta[int].geometry!.location!.lng
                                    .toString()),
                              ],
                            ),
                          );
                        }),
                      ),
                    )
                  ],
                );
              })),
    );
  }
}
