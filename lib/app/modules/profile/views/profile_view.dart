import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ProfileController profileController = Get.put(ProfileController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Expanded(
          child: ListView(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset('assets/logo_1.png', width: 70),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: FractionalOffset.center,
                      child: Obx(() => Text(
                        "Hallo, ${controller.username.value}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          fontStyle: FontStyle.normal,
                        ),
                      )),
                    ),
                  ),
                ],
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
                      Get.toNamed(Routes.PROFILE);
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


