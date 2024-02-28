import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/response_book.dart';
import '../../../routes/app_pages.dart';
import '../controllers/detail_peminjaman_controller.dart';

class DetailPeminjamanView extends GetView<DetailPeminjamanController> {
  const DetailPeminjamanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id'];

    if (id != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Book'),
          centerTitle: true,
          backgroundColor: Colors.grey.withOpacity(0.8),
        ),
        body: controller.obx((state) {
          DataBook? dataBook;
          for (final book in state ?? []) {
            if (book.id.toString() == id) {
              dataBook = book;
              break;
            }
          }

          if (dataBook != null) {
            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Image.network(
                            dataBook.image!,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Tentang Buku : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 25,
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              SizedBox(height: 20),
                              Text("Judul : ${dataBook.judul}"),
                              SizedBox(height: 8),
                              Text("Penulis : ${dataBook.penulis}"),
                              SizedBox(height: 8),
                              Text("Penerbit : ${dataBook.penerbit}"),
                              SizedBox(height: 8),
                              Text("Tahun Terbit : ${dataBook.tahunTerbit}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (dataBook != null) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Error"),
                            content: Text("Anda sedang meminjam buku ini."),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    animationDuration: Duration(milliseconds: 500),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  child: TweenAnimationBuilder(
                    duration: Duration(milliseconds: 500),
                    tween: Tween<double>(begin: 0, end: 1),
                    builder: (_, double angle, __) {
                      return Transform.rotate(
                        angle: angle * 6.3,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              color: Colors.blue,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Pinjam",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Text('Buku dengan ID $id tidak ada.'),
            );
          }
        }),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Buku'),
          centerTitle: true,
          backgroundColor: Colors.grey.withOpacity(0.8),
        ),
        body: Center(
          child: Text('Id Buku tidak tersedia.'),
        ),
      );
    }
  }
}
