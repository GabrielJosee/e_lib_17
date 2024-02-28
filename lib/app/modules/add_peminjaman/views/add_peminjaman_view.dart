import 'package:date_time_picker/date_time_picker.dart';
import 'package:e_lib_17_jose/app/modules/peminjaman/controllers/peminjaman_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AddPeminjamanController addPeminjamanController = Get.put(AddPeminjamanController());
    return Scaffold(
      appBar: AppBar(
        title: Text('${Get.parameters['judul'] ?? ''}'),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Text(
                "Buku yang dipinjam: ${Get.parameters['judul'] ?? ''}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              if (Get.parameters['image'] != null)
                Image.network(
                  Get.parameters['image'] ?? '', // Menggunakan 'image' dari parameter
                  height: 200, // Atur tinggi gambar sesuai kebutuhan
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }
                  },
                  errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                    return Text('Failed to load image'); // Widget yang ditampilkan jika gagal memuat gambar
                  },
                ),

              SizedBox(height: 20),
              DateTimePicker(
                icon: Icon(Icons.date_range_rounded),
                controller: controller.tanggalPController,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'Tambahkan Tanggal Pinjam',
                dateMask: 'yyyy-MM-dd',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              SizedBox(height: 20),
              DateTimePicker(
                icon: Icon(Icons.date_range_rounded),
                controller: controller.tanggalKController,
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'Tambahkan Tanggal Kembali',
                dateMask: 'yyyy-MM-dd',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              SizedBox(height: 20),
              Obx(() => controller.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  controller.add_pinjam();
                },
                child: Text(
                  "Pinjam",
                  style: TextStyle(
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
