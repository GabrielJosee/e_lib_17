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
        body: controller.obx(
              (state) => state != null && state.isNotEmpty
              ? ListView.separated(
            itemCount: state.length,
            itemBuilder: (context, index) {
              DataPinjam dataPinjam = state[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  title: Text(
                    "${dataPinjam.book?.judul}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tanggal Pinjam: ${dataPinjam.tanggalPinjam}",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "Tanggal Pengembalian: ${dataPinjam.tanggalKembali}",
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  trailing: Chip(
                    label: Text(
                      "${dataPinjam.status}",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: dataPinjam.status == "Dipinjam"
                        ? Colors.red
                        : Colors.green,
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(
              indent: 15,
              endIndent: 15,
            ),
          )
              : Center(child: Text(
            "Tidak ada data pinjaman",
            style: TextStyle(fontSize: 16),
          ),
          ),
          onLoading: Center(child: CupertinoActivityIndicator()),
        )
    );
  }
}
