import 'dart:io';
import 'package:dio/dio.dart';
import 'package:e_lib_17_jose/app/data/model/response_user.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/constant/endpoin.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';


class EditProfileController extends GetxController with StateMixin<DataUser?>{
  final loading = false.obs;
  final count = 0.obs;
  Rx<File?> profileImage = Rx<File?>(null);



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

  getData() async {
    change(null, status: RxStatus.loading());
    try {
      final response = await ApiProvider.instance().get(Endpoint.profil + "/${StorageProvider.read(StorageKey.idUser)}");
      if (response.statusCode == 200) {
        final ResponseUser responseUser = ResponseUser.fromJson(response.data);
        if(responseUser.data == null){
          change(null, status: RxStatus.empty());
        } else {
          change(responseUser.data, status: RxStatus.success());
        }
      } else {
        change(null, status: RxStatus.error("Gagal mengambil data"));
      }
    } on DioException catch (e) {
      if (e.response!= null) {
        if (e.response?.data!= null) {
          change(null, status: RxStatus.error("${e.response?.data['message']}"));
        }
      } else {
        change(null, status: RxStatus.error(e.message?? ""));
      }
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
            }
      }

  void increment() => count.value++;



}
