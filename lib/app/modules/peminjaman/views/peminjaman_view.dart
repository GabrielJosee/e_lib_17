import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/response_pinjam.dart';
import '../controllers/peminjaman_controller.dart';

class PeminjamanView extends GetView<PeminjamanController> {
  const PeminjamanView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PeminjamanView'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshData();
        },
        child: controller.obx(
              (state) {
            if (state != null && state.isNotEmpty) {
              return ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  DataPinjam dataPinjam = state[index];
                  return _buildPinjamItem(dataPinjam);
                },
              );
            } else {
              return Center(
                child: Text(
                  "Tidak ada data pinjaman",
                  style: TextStyle(fontSize: 16),
                ),
              );
            }
          },
          onLoading: Center(child: CupertinoActivityIndicator()),
        ),
      ),
    );
  }

  Widget _buildPinjamItem(DataPinjam dataPinjam) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => Get.toNamed('/detail-peminjaman?id=${dataPinjam.book?.id ?? 0}'),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${dataPinjam.book?.judul}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Tanggal Pinjam: ${dataPinjam.tanggalPinjam}",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 4),
              Text(
                "Tanggal Pengembalian: ${dataPinjam.tanggalKembali}",
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: dataPinjam.status == "Dipinjam" ? Colors.red : Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "${dataPinjam.status}",
                    style: TextStyle(color: Colors.white),
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
