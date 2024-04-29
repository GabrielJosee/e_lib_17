import 'package:get/get.dart';

import '../controllers/riwayat_pinjam_controller.dart';

class RiwayatPinjamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RiwayatPinjamController>(
      () => RiwayatPinjamController(),
    );
  }
}
