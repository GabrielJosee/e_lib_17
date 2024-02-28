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

  List<Widget> pageViewModel() {
    return [
      scr1(),
      PeminjamanView(),
      ProfileView(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      body: PageView(
        physics: BouncingScrollPhysics(),
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        children: pageViewModel(),
      ),
      bottomNavigationBar: NavigationBar(
        elevation: 0,
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: 500), curve: Curves.ease);
          });
        },
        backgroundColor: Theme.of(context).colorScheme.background,
        indicatorColor: Colors.transparent,
        selectedIndex: _currentPageIndex,
        destinations: <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.black),
            icon: Icon(Icons.home_outlined),
            label: 'Beranda',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.library_books, color: Colors.black),
            icon: Icon(Icons.library_books),
            label: 'Koleksi',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person_2, color: Colors.black),
            icon: Icon(Icons.person_2_outlined),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}

class scr1 extends StatelessWidget {
  final HomeController homeController = Get.put(HomeController());
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
                Image.asset(
                  'assets/logo_1.png',
                  width: 70,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.REGISTER);
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
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Menambahkan padding vertikal dan horizontal
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Cari Buku',
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 16), // Menambahkan fontSize
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
          const Text(
            "Terbaru",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            height: 300,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: homeController.obx(
                    (state) => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state!.length,
                  itemBuilder: (context, index) {
                    DataBook dataBook = state[index];
                    return InkWell(
                      onTap: () => Get.toNamed('/detail?id=${dataBook.id ?? 0}'),
                      child: Container(
                        width: 150,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Image.network(
                                      dataBook.image!,
                                      fit: BoxFit.cover, // Menyesuaikan gambar dengan container
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Center(
                                  child: Text(
                                    "${dataBook.judul}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10), // Atur jarak antara item
                ),
                onLoading: Center(child: const CircularProgressIndicator()),
              ),
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            "Recommended",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Container(
            height: 300,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: homeController.obx(
                    (state) => ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: state!.length,
                  itemBuilder: (context, index) {
                    DataBook dataBook = state[index];
                    return InkWell(
                      onTap: () => Get.toNamed('/detail?id=${dataBook.id ?? 0}'),
                      child: Container(
                        width: 150,
                        child: Card(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Center(
                                    child: Image.network(
                                      dataBook.image!,
                                      fit: BoxFit.cover, // Menyesuaikan gambar dengan container
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Center(
                                  child: Text(
                                    "${dataBook.judul}",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 10), // Atur jarak antara item
                ),
                onLoading: Center(child: const CircularProgressIndicator()),
              ),
            ),
          )
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
        return InkWell(
          onTap: () => Get.toNamed('/detail?id=${dataBook.id ?? 0}'),
          child: Card(
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
