import 'package:get/get.dart';

import '../../../data/provider/storage_provider.dart';

class ProfileController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final count = 0.obs;
  final RxString username = ''.obs;

  @override
  void onInit() {
    super.onInit();
    username.value = StorageProvider.read(StorageKey.username) ?? '';
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
