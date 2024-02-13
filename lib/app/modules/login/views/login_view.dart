import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Center(
          child: Form(
            key: controller.formKey,
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80.0,
                    ),
                    Image.asset(
                      "assets/logo_1.png",
                      height: 200,
                      width: 700,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 45.0,
                ),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: controller.usernameController,
                        decoration: const InputDecoration(
                          hintText: "Masukan Username",
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Username tidak boleh kosong";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 26.0,
                      ),
                      Container(
                        child: Obx(() => TextFormField(
                          controller: controller.passswordController,
                          obscureText: !controller.passwordVisible.value,
                          decoration: InputDecoration(
                            hintText: "Masukan Password",
                            suffixIcon: IconButton(
                              icon: Icon(controller.passwordVisible.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                                  color: Colors.black),
                              onPressed: () {
                                controller.togglePasswordVisibility();
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password tidak boleh kosong";
                            }
                            return null;
                          },
                        )),
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.REGISTER);
                          },
                          child: const Text(
                            "Lupa Password?",
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 70.0,
                      ),
                      Obx(
                            () => controller.loading.value
                            ? const Center(
                          child: CircularProgressIndicator(),
                        )
                            : Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 120),
                        child: RawMaterialButton(
                          fillColor: const Color(0xFF000000),
                          elevation: 0.0,
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          onPressed: () {
                            controller.login();
                          },
                          child: const Text("MASUK", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 120),
                        child: RawMaterialButton(
                          fillColor: const Color(0xFF000000),
                          elevation: 0.0,
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          onPressed: () {
                            Get.toNamed(Routes.REGISTER);
                          },
                          child: const Text("DAFTAR AKUN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        ),
                      )

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

