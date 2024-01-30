import 'package:e_lib_17_jose/Views/Edit.dart';
import 'package:e_lib_17_jose/Views/Home.dart';
import 'package:e_lib_17_jose/Views/Koleksi.dart';
import 'package:e_lib_17_jose/Views/Login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controller/NavController.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _profilepageState();
}

class _profilepageState extends State<ProfilePage> {
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
              icon: Icon(Icons.home, size: 24), // Adjust the icon size
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Icons.library_books_sharp, size: 24), // Adjust the icon size
              label: "Koleksiku",
            ),
            NavigationDestination(
              icon: Icon(Icons.account_circle, size: 24), // Adjust the icon size
              label: "Profile",
            ),
          ],
        ),
      ),
      body: Expanded(
        child: ListView(
          children: [
            Padding( padding : const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/logo_1.png' , width: 70,)
                ],
              ),
            ),
            Stack(
                children: [
                  Center(
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1)
                            ),
                          ],
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image:
                              AssetImage('assets/p.jpg')
                          )
                      ),
                    ),
                  )
                ]
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 150),
                child: RawMaterialButton(
                  fillColor: Color(0xFF000000),
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const EditPage()),);
                  }, child: const Text("Edit Profile", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                showLogoutConfirmationDialog(context);
              },
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white.withOpacity(0.1),
                  ),
                  child: const Icon(Icons.logout),
                ),
                title: Text("Logout", style: Theme.of(context).textTheme.bodyText1,),
                trailing: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  child: const Icon(Icons.chevron_right, size: 18, color: Colors.black,),
                ),
              ),
            ),
          ],

        ),
      ),
    );
  }
}

void showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.grey[200],
        title: const Text("Logout", style: TextStyle(color: Colors.black)),
        content: const Text("Yakin ingin Logout?", style: TextStyle(color: Colors.black)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              primary: Colors.black,
            ),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            style: TextButton.styleFrom(
              primary: Colors.white,
              backgroundColor: Colors.grey[600],
            ),
            child: const Text("Logout"),
          ),
        ],
      );
    },
  );
}
