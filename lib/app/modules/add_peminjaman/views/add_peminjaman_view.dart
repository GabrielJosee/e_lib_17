import 'package:date_time_picker/date_time_picker.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_peminjaman_controller.dart';

class AddPeminjamanView extends GetView<AddPeminjamanController> {
  const AddPeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(AddPeminjamanController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Peminjaman Buku"),
        centerTitle: true,
      ),
      body: Center(
        child: Form(
          key: controller.formKey,
          child: Stack(
            alignment: Alignment.center,
            children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (Get.parameters['image'] != null)
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Stack(
                      children: [
                        Image.network(
                          Get.parameters['image'] ?? '',
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.2),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "${Get.parameters['judul'] ?? ''}",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
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
              Obx(
                () => controller.loading.value
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
          ]
        ),
      ),
      )
    );
  }
}
