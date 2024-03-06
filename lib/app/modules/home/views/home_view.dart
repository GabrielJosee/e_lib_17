import 'dart:math';

import 'package:e_lib_17_jose/app/modules/peminjaman/controllers/peminjaman_controller.dart';
import 'package:e_lib_17_jose/app/modules/peminjaman/views/peminjaman_view.dart';
import 'package:e_lib_17_jose/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/model/response_book.dart';
import '../../../routes/app_pages.dart';
import '../../book/controllers/book_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookController bookController = Get.put(BookController());
    final PeminjamanController peminjamanController = Get.put(PeminjamanController());
    return HomeViewStful();
  }
}

class HomeViewStful extends StatefulWidget {
  @override
  State<HomeViewStful> createState() => _HomeViewStfulState();
}

class _HomeViewStfulState extends State<HomeViewStful> {
  int _currentPageIndex = 0;
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        itemCount: 3,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return Scr1();
            case 1:
              return const PeminjamanView();
            case 2:
              return const ProfileView();
            default:
              return const SizedBox.shrink();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        onTap: (int index) {
          setState(() {
            _currentPageIndex = index;
            _pageController.animateToPage(index,
                duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
          });
        },
        backgroundColor: Theme.of(context).colorScheme.background,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentPageIndex,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home, color: Colors.black),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            activeIcon: Icon(Icons.library_books, color: Colors.black),
            label: 'Peminjaman',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            activeIcon: Icon(Icons.person_2, color: Colors.black),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class Scr1 extends StatelessWidget {
  final HomeController homeController = Get.find();
  final BookController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(() => HomeView());
                  },
                  child: Image.asset(
                    'assets/logo_1.png',
                    width: 70,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.PROFILE);
                  },
                  child: const Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showSearch(context: context, delegate: BookSearch(controller: controller));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Cari Buku',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 16),
                          ),
                        ),
                        Icon(Icons.search),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Terbaru",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 8.0),
              Container(
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: homeController.obx(
                        (state) {
                      if (state == null || state.isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      // Urutkan berdasarkan createdAt
                      state.sort((a, b) {
                        if (a.createdAt != null && b.createdAt != null) {
                          return b.createdAt!.compareTo(a.createdAt!);
                        } else {
                          return 0;
                        }
                      });

                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.length,
                        itemBuilder: (context, index) {
                          DataBook dataBook = state[index];
                          return InkWell(
                            onTap: () => Get.toNamed('/detail?id=${dataBook.id ?? 0}'),
                            child: Container(
                              width: 150,
                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          dataBook.image!,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "${dataBook.judul}",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            "Penulis: ${dataBook.penulis}",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(width: 10),
                      );
                    },
                    onLoading: const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recommended",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    height: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: homeController.obx(
                            (state) {
                          if (state == null || state.isEmpty) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }

                          // Acak urutan data
                          List<DataBook> randomBooks = List.of(state);
                          randomBooks.shuffle();

                          return ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: randomBooks.length,
                            itemBuilder: (context, index) {
                              DataBook dataBook = randomBooks[index];
                              return InkWell(
                                onTap: () => Get.toNamed('/detail?id=${dataBook.id ?? 0}'),
                                child: Container(
                                  width: 150,
                                  child: Card(
                                    elevation: 4,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(10),
                                            child: Image.network(
                                              dataBook.image ?? '', // Handle null image
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${dataBook.judul}",
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                "Penulis: ${dataBook.penulis ?? 'Unknown'}", // Handle null author
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) => const SizedBox(width: 10),
                          );
                        },
                        onLoading: const Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
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
    final List<DataBook> filteredBooks = controller.state?.where((book) {
      return book.judul!.toLowerCase().contains(query.toLowerCase());
    }).toList() ?? [];

    if (filteredBooks.isEmpty) {
      return Center(
        child: Text(
          "Tidak ada hasil yang ditemukan.",
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return Container(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Center( // Widget Center untuk membuat hasil di tengah
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filteredBooks.length,
            itemBuilder: (context, index) {
              DataBook dataBook = filteredBooks[index];
              return InkWell(
                onTap: () {
                  Get.toNamed('/detail?id=${dataBook.id ?? 0}');
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7, // Lebar card
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20), // Bentuk bulatan pada sudut
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          child: Image.network(
                            dataBook.image!,
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20), // Agar gambar terpotong sesuai sudut card
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${dataBook.judul}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "Penulis: ${dataBook.penulis}",
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
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
          leading: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(dataBook.image ?? ''), // Gambar dari URL
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
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



