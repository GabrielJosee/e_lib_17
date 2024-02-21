import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Form(
              key: controller.formKey,
              child: ListView(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 30.0,
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
                      controller: controller.namaController,
                      decoration: const InputDecoration(
                        hintText: "Masukan Nama",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Nama tidak boleh kosong";
                        }
                        return null;
                      },
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
                    ),TextFormField(
                      controller: controller.telpController,
                      decoration: const InputDecoration(
                        hintText: "Masukan Telephone",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Telephone tidak boleh kosong";
                        }
                        return null;
                      },
                    ),TextFormField(
                      controller: controller.alamatController,
                      decoration: const InputDecoration(
                        hintText: "Masukan Alamat",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Alamat tidak boleh kosong";
                        }
                        return null;
                      },
                    ),
                        Container(
                          child: Obx(() => TextFormField(
                            controller: controller.passwordController,
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
                        SizedBox(
                          height: 20,
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
                                controller.register();
                              },
                              child: const Text("REGISTER", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                ],
              )
                  ),
            ]
    )
      )
    )
    );
  }
}
