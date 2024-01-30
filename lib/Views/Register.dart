import 'package:flutter/material.dart';

import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _registerpageState();
}

class _registerpageState extends State<RegisterPage> {
  bool passwordVisible = false;

  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 80.0,
                ),
                Image.asset(
                  "assets/logo_1.png",
                  height: 200,
                  width: 700,
                ),
              ],
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TextField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: "Username",
                        prefixIcon: Icon(Icons.account_circle, color: Colors.black,)
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Icons.mail, color: Colors.black,)
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Nomor Telepone",
                        prefixIcon: Icon(Icons.phone, color: Colors.black,)
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    child: TextField(
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock, color: Colors.black,),
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible? Icons.visibility_off : Icons.visibility, color: Colors.black,),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 80.0,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 120),
                    child: RawMaterialButton(
                      fillColor: const Color(0xFF000000),
                      elevation: 0.0,
                      padding: const EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()),);
                      }, child: const Text("DAFTAR", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
