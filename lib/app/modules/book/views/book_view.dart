import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/response_book.dart';
import '../../../routes/app_pages.dart';
import '../controllers/book_controller.dart';

class BookView extends GetView<BookController> {
  const BookView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Buku'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: BookSearch(controller: controller));
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: controller.state?.length ?? 0,
        itemBuilder: (context, index) {
          DataBook dataBook = controller.state![index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                "${dataBook.judul}",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                "Penulis ${dataBook.penulis}\n${dataBook.penerbit} - ${dataBook.tahunTerbit}",
                style: TextStyle(fontSize: 14),
              ),
              trailing: InkWell(
                onTap: () => Get.toNamed(
                  Routes.ADD_PEMINJAMAN,
                  parameters: {
                    "id": (dataBook.id ?? 0).toString(),
                    'judul': dataBook.judul ?? '-',
                  },
                ),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        "Pinjam",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class BookSearch extends SearchDelegate<String> {
  final BookController controller;

  BookSearch({required this.controller});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<DataBook> filteredBooks = controller.state?.where((book) {
      return book.judul!.toLowerCase().contains(query.toLowerCase());
    }).toList() ?? [];

    return ListView.separated(
      itemCount: filteredBooks.length,
      itemBuilder: (context, index) {
        DataBook dataBook = filteredBooks[index];
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: ListTile(
            title: Text(
              "${dataBook.judul}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              "Penulis ${dataBook.penulis}\n${dataBook.penerbit} - ${dataBook.tahunTerbit}",
              style: TextStyle(fontSize: 14),
            ),
            trailing: InkWell(
              onTap: () => Get.toNamed(
                Routes.REGISTER,
                parameters: {
                  "id": (dataBook.id ?? 0).toString(),
                  'judul': dataBook.judul ?? '-',
                },
              ),
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.shopping_cart,
                      color: Colors.white,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "Pinjam",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => Divider(),
    );
  }


  @override
  Widget buildSuggestions(BuildContext context) {
    final List<DataBook> allBooks = controller.state ?? [];
    final List<DataBook> suggestionList = query.isEmpty
        ? allBooks
        : allBooks.where((book) {
      return book.judul!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        DataBook dataBook = suggestionList[index];
        return ListTile(
          title: Text(
            "${dataBook.judul}",
          ),
          onTap: () {
            query = dataBook.judul!;
            showResults(context);
          },
        );
      },
    );
  }
}




