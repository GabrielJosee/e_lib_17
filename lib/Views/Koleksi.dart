import 'package:e_lib_17_jose/Views/Home.dart';
import 'package:e_lib_17_jose/Views/Profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/NavController.dart';

class KoleksiPage extends StatefulWidget {
  const KoleksiPage({super.key});

  @override
  State<KoleksiPage> createState() => _koleksipageState();
}

class _koleksipageState extends State<KoleksiPage> {
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
          height: 60, // Adjust the height as needed
          elevation: 0.0,
          backgroundColor: Colors.grey.withOpacity(0.1),
          selectedIndex: _controller.selectedIndex.value,
          onDestinationSelected: (index) {
            _controller.selectedIndex.value = index;
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => list[index],
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
      body: ListView(

      ),
    );
  }
}
