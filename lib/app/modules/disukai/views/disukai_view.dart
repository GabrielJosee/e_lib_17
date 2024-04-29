import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/disukai_controller.dart';

class DisukaiView extends GetView<DisukaiController> {
  const DisukaiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DisukaiView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DisukaiView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
