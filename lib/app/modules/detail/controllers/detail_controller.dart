import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoin.dart';
import '../../../data/model/response_book.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class DetailController extends GetxController with StateMixin<List<DataBook>>{

  //TODO: Implement DetailController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getDetailBuku();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getDetailBuku() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.book+"/${StorageProvider.read(StorageKey.idBuku)}" );
      if (response.statusCode == 200) {
        final ResponseBook responseBook = ResponseBook.fromJson(response.data);
        if (responseBook.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseBook.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(
              null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
    }
}
