import 'package:get/get.dart';

import '../controllers/detail_peminjaman_controller.dart';

class DetailPeminjamanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailPeminjamanController>(
      () => DetailPeminjamanController(),
    );
  }
}
