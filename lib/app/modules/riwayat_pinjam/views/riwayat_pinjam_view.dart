import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/riwayat_pinjam_controller.dart';

class RiwayatPinjamView extends GetView<RiwayatPinjamController> {
  const RiwayatPinjamView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RiwayatPinjamView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RiwayatPinjamView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
