import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final bool _secureText = true;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color.fromARGB(255, 11, 11, 20),
      body: SafeArea(
        child: ListView(
        padding: const EdgeInsets.only(right: 28, left: 28, bottom: 50),
          children: [
            const Image(
              height: 240,
              image: AssetImage('assets/images/movie-apps-logo-no-bg.png'),
            ),
            Card(
              elevation: 4.0,
              color: Colors.white10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        autofocus: true,
                        cursorColor: Colors.blue,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Email",
                        ),
                        // validator: (emailValue) {
                        //   if (emailValue!.isEmpty) {
                        //     return 'Please enter your email';
                        //   }
                        //   email = emailValue;
                        //   return null;
                        // },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        cursorColor: Colors.blue,
                        keyboardType: TextInputType.text,
                        obscureText: _secureText,
                        decoration: InputDecoration(
                          hintText: "Password",
                          // suffixIcon: IconButton(
                          //   onPressed: showHide,
                          //   icon: Icon(_secureText
                          //       ? Icons.visibility_off
                          //       : Icons.visibility),
                          // ),
                        ),
                        // validator: (passwordValue) {
                        //   if (passwordValue!.isEmpty) {
                        //     return 'Please enter your password';
                        //   }
                        //   password = passwordValue;
                        //   return null;
                        // },
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          child: Text(
                            _isLoading ? 'Proccessing..' : 'Login',
                            textDirection: TextDirection.ltr,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          //   _login();
                          // }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Tidak Punya Akun? ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      decoration: TextDecoration.none,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
