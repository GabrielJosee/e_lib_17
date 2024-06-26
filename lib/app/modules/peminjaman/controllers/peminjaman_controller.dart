import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/constant/endpoin.dart';
import '../../../data/model/response_pinjam.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';

class PeminjamanController extends GetxController with StateMixin<List<DataPinjam>> {
  final count = 0.obs;
  var loading = false.obs; // Tambahkan variabel loading

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> refreshData() async {
    getData(showSnackBar: true);
  }

  getData({bool showSnackBar = false}) async {
    loading.value = true; // Set loading true saat mengambil data
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.pinjam + '/${StorageProvider.read(StorageKey.idUser)}');
      if (response.statusCode == 200) {
        final ResponsePinjam responsePinjam = ResponsePinjam.fromJson(response.data);
        if (responsePinjam.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          List<DataPinjam> existingData = state ?? [];
          existingData.addAll(responsePinjam.data!);
          change(existingData, status: RxStatus.success());
          if (showSnackBar) {
            Get.snackbar("Success", "Data telah diperbarui", backgroundColor: Colors.green.shade300);
          }
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
    } finally {
      loading.value = false; // Set loading false setelah selesai mengambil data
    }
  }
}
