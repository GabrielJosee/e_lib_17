import 'dart:async';

import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../../../data/constant/endpoin.dart';
import '../../../data/model/response_book.dart';
import '../../../data/provider/api_provider.dart';

class HomeController extends GetxController with StateMixin<List<DataBook>> {
  final Rx<int> selectedIndex = 0.obs;
  var isLoading = true.obs;
  final count = 0.obs;
  List<DataBook>? filteredBooks;
  // Timer? _refreshTimer;

  @override
  void onInit() {
    getData();  // Panggil getData() saat inisialisasi
    // startAutoRefresh();  // Mulai auto refresh
    super.onInit();
    filteredBooks = [];
  }

  // void startAutoRefresh() {
  //   // Tentukan interval waktu untuk refresh, misalnya setiap 1 menit (60000 ms)
  //   const duration = Duration(seconds: 1);
  //   _refreshTimer = Timer.periodic(duration, (timer) {
  //     getData();  // Refresh data
  //   });
  // }
  //
  // void stopAutoRefresh() {
  //   _refreshTimer?.cancel();
  // }

  @override
  void onClose() {
    // stopAutoRefresh();
    super.onClose();
  }

  getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.book);
      if (response.statusCode == 200) {
        final ResponseBook responseBook = ResponseBook.fromJson(response.data);
        if (responseBook.data!.isEmpty) {
          change(null, status: RxStatus.empty());
        } else {
          List<DataBook> dataBooks = responseBook.data!.map((bookData) {
            return DataBook(
              id: bookData.id,
              judul: bookData.judul,
              image: bookData.image,
              penulis: bookData.penulis,
            );
          }).toList();

          change(dataBooks, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response?.data != null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message ?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  void search(String query) {
    if (query.isEmpty) {
      filteredBooks = state;
    } else {
      filteredBooks = state?.where((book) {
        return book.judul?.toLowerCase().contains(query.toLowerCase()) ?? false;
      }).toList();
    }
    update();
  }

}
