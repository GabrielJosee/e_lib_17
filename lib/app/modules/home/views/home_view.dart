import 'package:e_lib_17_jose/app/modules/book/views/book_view.dart';
import 'package:e_lib_17_jose/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../../book/controllers/book_controller.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BookController bookController = Get.put(BookController());
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
      BookView(),
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
  const scr1({Key? key}) : super(key: key);

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
                const Text(
                  "Hallo, J",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    fontStyle: FontStyle.normal,
                  ),
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Cari Buku",
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.black),
              ),
            ),
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
            height: 200,
            child: PageView(
              children: [
                CustomMenu(
                  imageAsset: "assets/logo_1.png",
                  title: "Foto 1",
                ),
                CustomMenu(
                  imageAsset: "assets/logo_1.png",
                  title: "Foto 2",
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const Text(
            "Rekomendasi",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey.shade200,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: CustomMenu2(
                        imageAsset: "assets/logo_1.png",
                        title: "Foto 1",
                      ),
                    ),
                  ),
                  const VerticalDivider(color: Colors.grey, thickness: 1),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      child: const CustomMenu2(
                        imageAsset: "assets/logo_1.png",
                        title: "Foto 2",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomMenu extends StatelessWidget {
  final String imageAsset;
  final String title;

  const CustomMenu({
    required this.imageAsset,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(Routes.REGISTER);
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAsset,
              height: 80,
              width: 250,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            Text(title,style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15),),
          ],
        ),
      ),
    );
  }
}

class CustomMenu2 extends StatelessWidget {
  const CustomMenu2({
    super.key,
    required this.imageAsset,
    required this.title,
  });

  final String imageAsset;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 300,
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageAsset,
              alignment: Alignment.center,
              width: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }
}