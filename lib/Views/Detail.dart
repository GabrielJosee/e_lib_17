import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detail Buku',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.grey.shade300,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              alignment: Alignment.center,
              child: Image.asset(
                "assets/logo_1.png",
                height: 200,
                width: 200,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
              alignment: Alignment.topCenter,
              child: const Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Judul : Kamus gereja katolik bagi kaum awam "
                          "\nPengarang : AL. Purwa Hadiwardoyo, MSF "
                          "\nPenerbitan : Yogyakarta : PT. Kanisius, 2020 "
                          "\nDeskripsi Fisik : 229 halaman ; 20 cm",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade200,
              ),
              alignment: Alignment.center,
              child: const Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Sinopsis",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Kamus sederhana ini ditujukan untuk kaum awam. Kamus ini tersusun dengan baik dan berguna bagi awam juga mengenal dan memahami mengenai dunia Hukum Gereja. Penulis menggunakan istilah-istilah yuridis yang mudah dipahami untuk mengenal isi Kitab Hukum Kanonik yang terdiri atas 1759 pasal."
                          " Penulis mencantumkan istilah-istilah yang sekiranya relevan dan juga istilah dalam bahasa Latin, yang disusun secara alfabetis dan ringkas namun sangat bermanfaat.",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
