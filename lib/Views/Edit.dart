import 'package:flutter/material.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _editprofileState();
}

class _editprofileState extends State<EditPage> {
  bool passwordVisible = false;

  @override
  void initState(){
    super.initState();
    passwordVisible=true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Expanded(
        child: Container(
          padding: EdgeInsets.only(top: 15, left: 15,right: 15),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                Center(
                  child: Stack(
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
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 4,
                                  color: Colors.white70
                              ),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                buildTextField("Username", "Follow jose.fabbian", false),
                buildTextField("Email", "jibrilke2@gmail.com", false),
                buildTextField("Nomer Telephone", "+62 85727796640", false),
                buildTextField("Password", "*********", true),
                SizedBox(height: 30),
                Container(
                  width: double.infinity,
                  margin: const EdgeInsets.symmetric(horizontal: 120),
                  child: RawMaterialButton(
                    fillColor: const Color(0xFF000000),
                    elevation: 0.0,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const EditPage()),);
                    }, child: const Text("SIMPAN", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder, bool isPasswordTextField){
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextField(
        obscureText: passwordVisible ? true : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField ?
            IconButton(
              icon: Icon(passwordVisible? Icons.visibility_off : Icons.visibility, color: Colors.black,),
              onPressed: () {
                setState(() {
                  passwordVisible = !passwordVisible;
                });
              },
            ) :null,
            contentPadding: EdgeInsets.only(bottom: 5),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey
            )
        ),
      ),
    );
  }
}
