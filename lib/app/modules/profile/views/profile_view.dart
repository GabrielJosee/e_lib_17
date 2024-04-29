import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../../home/views/home_view.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Gambar di kiri atas pojok
                  GestureDetector(
                    onTap: () {
                      Get.offAllNamed(Routes.HOME);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10), // Padding kiri
                      child: Image.asset(
                        'assets/logo_1.png',
                        width: 70,
                      ),
                    ),
                  ),
                  // Teks di tengah
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 7.0),
                      child: Text(
                        "Hallo, ${controller.username.value}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black, // Mengatur warna teks menjadi hitam
                          letterSpacing: 1.2,
                        ),
                        textAlign: TextAlign.center, // Membuat teks berada di tengah
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.grey),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/p.jpg'),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                ),
                onPressed: () {
                  Get.toNamed(Routes.EDIT_PROFILE);
                },
                child: Text("Edit Profile"),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Get.offAllNamed(Routes.DISUKAI);
                },
                child: ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: const Icon(Icons.bookmark_add_rounded),
                  ),
                  title: Text(
                    "Disukai",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Get.toNamed(Routes.RIWAYAT_PINJAM);
                },
                child: ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white.withOpacity(0.1),
                    ),
                    child: const Icon(Icons.menu_book_sharp),
                  ),
                  title: Text(
                    "Riwayat Peminjaman",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: Icon(Icons.chevron_right),
                ),
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
                  title: Text(
                    "Logout",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  trailing: Icon(Icons.chevron_right),
                ),
              ),
            ],
          ),
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
            onPressed: () async {
              await GetStorage().erase();
              Navigator.pushNamedAndRemoveUntil(context, Routes.LOGIN, (route) => false);
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
