import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/response_book.dart';
import '../../../routes/app_pages.dart';
import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);

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
                              const Text(
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
                              SizedBox(height: 16),
                              const Row(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 15,
                                  ),
                                  // Text(
                                  //   '${Get.parameters['rating']}',
                                  //   style: TextStyle(
                                  //       fontWeight: FontWeight.w800,
                                  //       fontSize: 12,
                                  //       color: Theme.of(context)
                                  //           .colorScheme
                                  //           .primary),
                                  // ),
                                ],
                              ),

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
                  child: LayoutBuilder(
                    builder: (context, constraints) => Container(
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Color(0xFFD9D9D9),
                          width: 1,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10, top: 20, bottom: 12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Deskripsi Buku : ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                ExpandableText(
                                  text: "${dataBook?.deskripsi}",
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (dataBook != null) {
                      Get.toNamed(
                        Routes.ADD_PEMINJAMAN,
                        parameters: {
                          'id': (dataBook.id ?? 0).toString(),
                          'judul': dataBook.judul ?? '-',
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
                        child: const Row(
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
class ExpandableText extends StatefulWidget {
  final String text;
  final int maxLines;

  ExpandableText({
    required this.text,
    this.maxLines = 4,
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 300),
          crossFadeState: _isExpanded
              ? CrossFadeState.showSecond
              : CrossFadeState.showFirst,
          firstChild: Text(
            widget.text,
            maxLines: widget.maxLines,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 14,
            ),
          ),
          secondChild: Text(
            widget.text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.secondary,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 6),
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(
            _isExpanded ? 'Show Less' : 'Show More',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}