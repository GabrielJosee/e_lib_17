import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoin.dart';
import '../../../data/model/resoponse_book.dart';
import '../../../data/provider/api_provider.dart';

class BookController extends GetxController  with StateMixin<List<DataBook>>{

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getData();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getData() async {
    change (null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(
        Endpoint.book,
      );
      if (response.statusCode == 200) {
        final ResoponseBook resoponseBook = ResoponseBook.fromJson(response.data);
        if (resoponseBook.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(resoponseBook.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null,
              status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

}
