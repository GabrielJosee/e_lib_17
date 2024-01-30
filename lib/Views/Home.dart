import 'package:e_lib_17_jose/Views/Detail.dart';
import 'package:e_lib_17_jose/Views/Koleksi.dart';
import 'package:e_lib_17_jose/Views/Profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/NavController.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _home_pageState();
}

class _home_pageState extends State<HomePage> {
  final NavigationController _controller = Get.put(NavigationController());
  List<Widget> list = const [
    HomePage(),
    KoleksiPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
            () => NavigationBar(
          height: 60,
          elevation: 0.0,
          backgroundColor: Colors.grey.withOpacity(0.1),
          selectedIndex: _controller.selectedIndex.value,
          onDestinationSelected: (index) {
            _controller.selectedIndex.value = index;
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                list[index],
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  const begin = 0.0;
                  const end = 1.0;
                  var tween = Tween(begin: begin, end: end);
                  var fadeAnimation = animation.drive(tween);
                  return FadeTransition(opacity: fadeAnimation, child: child);
                },
                transitionDuration: const Duration(milliseconds: 500),
              ),
            );
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home, size: 24),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.library_books_sharp, size: 24),
              label: "Koleksiku",
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle, size: 24),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: Expanded(
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => DetailPage()),
                      );
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailPage(),
                            ),
                          );
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailPage(),
                            ),
                          );
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
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailPage()),
        );
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

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            HomePage(),
          ],
        ),
      ),
    ),
  );
}
