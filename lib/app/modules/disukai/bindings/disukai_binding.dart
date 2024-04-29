import 'package:get/get.dart';

import '../controllers/disukai_controller.dart';

class DisukaiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DisukaiController>(
      () => DisukaiController(),
    );
  }
}
