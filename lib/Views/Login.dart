import 'package:e_lib_17_jose/Views/Home.dart';
import 'package:e_lib_17_jose/Views/Register.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _loginpageState();
}

class _loginpageState extends State<LoginPage> {
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
            const SizedBox(
              height: 45.0,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10.0,
                  ),
                  const TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.mail,color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 26.0,
                  ),
                  Container(
                    child: TextField(
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Icons.lock, color: Colors.black),
                        suffixIcon: IconButton(
                          icon: Icon(passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility, color: Colors.black,),
                          onPressed: () {
                            setState(
                                  () {
                                passwordVisible = !passwordVisible;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Container(
                    margin:EdgeInsets.only(left: 290),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterPage()));
                      },
                      child: const Text(
                          "Lupa Password?",
                          style: TextStyle(color: Colors.blue)
                      ),
                    ),
                  ),
                  const  SizedBox(
                    height: 70.0,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 120),
                    child: RawMaterialButton(
                      fillColor: Color(0xFF000000),
                      elevation: 0.0,
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      onPressed: () {}, child: Text("MASUK", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 120),
                    child: RawMaterialButton(
                      fillColor: Color(0xFF000000),
                      elevation: 0.0,
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      onPressed: () {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()),);
                      }, child: Text("DAFTAR AKUN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    ),
                  )
                ],
              ),
            )
          ],

        ),
      ),
    );
  }
}