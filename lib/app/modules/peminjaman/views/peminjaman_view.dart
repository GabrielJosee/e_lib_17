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
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: PeminjamanSearch(controller: controller),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.refreshData();
        },
        child: controller.obx(
              (state) {
            if (state != null) {
              if (state.isEmpty) {
                // Menampilkan pesan jika data kosong
                return Center(
                  child: Text(
                    "Tidak ada data pinjaman",
                    style: TextStyle(fontSize: 16),
                  ),
                );
              } else {
                // Memperbarui tampilan jika ada data
                return ListView.builder(
                  itemCount: state.length,
                  itemBuilder: (context, index) {
                    DataPinjam dataPinjam = state[index];
                    return _buildPinjamItem(dataPinjam);
                  },
                );
              }
            } else {
              // Menampilkan indikator loading ketika data masih dimuat
              return Center(child: CircularProgressIndicator());
            }
          },
          onLoading: Center(child: CircularProgressIndicator()),
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
              Row(
                children: [
                  // Tambahkan gambar di sini jika tersedia
                  // Misalnya: Image.asset('assets/images/book_cover.png', width: 80, height: 120),
                  SizedBox(width: 16),
                  Expanded(
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () => Get.toNamed('/detail-peminjaman?id=${dataPinjam.book?.id ?? 0}'),
                  child: Center(
                    child: Text(
                      "${dataPinjam.status}",
                      style: TextStyle(color: Colors.white),
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

class PeminjamanSearch extends SearchDelegate<String> {
  final PeminjamanController controller;

  PeminjamanSearch({required this.controller});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<DataPinjam> filteredPeminjaman = controller.state?.where((peminjaman) {
      return peminjaman.book?.judul!.toLowerCase().contains(query.toLowerCase()) ?? false;
    }).toList() ?? [];

    if (filteredPeminjaman.isEmpty) {
      return Center(
        child: Text(
          "Tidak ada hasil yang ditemukan.",
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return ListView.builder(
      itemCount: filteredPeminjaman.length,
      itemBuilder: (context, index) {
        DataPinjam dataPinjam = filteredPeminjaman[index];
        return _buildPinjamItem(context, dataPinjam);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<DataPinjam> borrowedBooks = controller.state ?? [];
    final List<DataPinjam> suggestionList = query.isEmpty
        ? borrowedBooks
        : borrowedBooks.where((peminjaman) {
      return peminjaman.book?.judul!.toLowerCase().contains(query.toLowerCase()) ?? false;
    }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        DataPinjam borrowedBook = suggestionList[index];
        return ListTile(
          title: Text(
            borrowedBook.book?.judul ?? '',
          ),
          onTap: () {
            query = borrowedBook.book?.judul ?? '';
            showResults(context);
          },
        );
      },
    );
  }


  Widget _buildPinjamItem(BuildContext context, DataPinjam dataPinjam) {
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
              Row(
                children: [
                  // Tambahkan gambar di sini jika tersedia
                  // Misalnya: Image.asset('assets/images/book_cover.png', width: 80, height: 120),
                  SizedBox(width: 16),
                  Expanded(
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
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: InkWell(
                  onTap: () => Get.toNamed('/detail-peminjaman?id=${dataPinjam.book?.id ?? 0}'),
                  child: Center(
                    child: Text(
                      "${dataPinjam.status}",
                      style: TextStyle(color: Colors.white),
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





