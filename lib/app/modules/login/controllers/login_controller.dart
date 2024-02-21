import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

import '../../../data/constant/endpoin.dart';
import '../../../data/model/response_login.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passswordController = TextEditingController();
  final loading = false.obs;
  final passwordVisible = false.obs;


  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  @override
  void onReady() {
    super.onReady();
    // Cek status login
    String status = StorageProvider.read(StorageKey.status);
    log("status : $status");
    if (status == 'logged') {
      Get.offAllNamed(Routes.HOME);
    }
  }
    login() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus(); // Menutup keyboard
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.login,
            data: dio.FormData.fromMap({
              "username": usernameController.text.toString(),
              "password": passswordController.text.toString()
            }));
        if (response.statusCode == 200) {
          final ResponseLogin responseLogin =
          ResponseLogin.fromJson(response.data);
          await StorageProvider.write(StorageKey.status, "logged");
          await StorageProvider.write(
              StorageKey.idUser, responseLogin.data!.id!.toString());
          await StorageProvider.write(StorageKey.username, responseLogin.data!.username!);
          Get.offAllNamed(Routes.HOME);
          Get.snackbar("Success", "Login Berhasil", backgroundColor: Colors.grey.shade300);
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar("Sorry", "${e.response?.data['message']}",
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
    }
  }
}