import 'package:e_lib_17_jose/app/modules/book/controllers/book_controller.dart';
import 'package:e_lib_17_jose/app/modules/peminjaman/controllers/peminjaman_controller.dart';
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

  @override
  void onInit() {
    super.onInit();
    filteredBooks = [];
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
