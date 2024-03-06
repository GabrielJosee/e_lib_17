import 'package:dio/dio.dart';
import 'package:e_lib_17_jose/app/data/model/response_ratings.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoin.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class RatingController extends GetxController with StateMixin<List<DataRating>>{
  //TODO: Implement RatingController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getUlasan();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
  getUlasan() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.ulasan+"/${StorageProvider.read(StorageKey.idUlasan)}" );
      if (response.statusCode == 200) {
        final ResponseRatings responseRatings = ResponseRatings.fromJson(response.data);
        if (responseRatings.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          change(responseRatings.data, status: RxStatus.success());
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
  void increment() => count.value++;
}
