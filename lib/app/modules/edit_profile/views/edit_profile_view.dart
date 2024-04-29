
import 'dart:io';

import 'package:e_lib_17_jose/app/data/model/response_user.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/edit_profile_controller.dart';



class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(()=>EditProfileController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
        centerTitle: true,
       backgroundColor: Colors.grey.shade300,
      ),
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: controller.obx((state) => _buildProfil(state!)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfil(DataUser? dataProfil) {
    return SingleChildScrollView(
        child: Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 25),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/p.jpg'),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16), // Add some vertical spacing above the "Informasi Akun" text
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Informasi Akun :",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 14),
                Form(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          initialValue: dataProfil?.username,
                          decoration: InputDecoration(
                            labelText: "Username",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          initialValue: dataProfil?.nama,
                          decoration: InputDecoration(
                            labelText: "Nama",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          initialValue: dataProfil?.alamat,
                          decoration: InputDecoration(
                            labelText: "Alamat",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          initialValue: dataProfil?.telp,
                          decoration: InputDecoration(
                            labelText: "No Telepon",
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 12),
                        TextFormField(
                          initialValue: dataProfil?.role,
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: "Role",
                            border: OutlineInputBorder(),
                            fillColor: Colors.grey[200],
                            filled: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 200, // Set a fixed width for the button
                    child: ElevatedButton(
                      onPressed: () {
                        /*controller.logout();*/
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 0,
                        padding: EdgeInsets.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Ink(
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF0CBD63),
                              Color(0xFF37FF98),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          height: 50,
                          child: const Center(
                            child: Text(
                              "Update",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ),
    );
  }
}
