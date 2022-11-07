import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/routes/app_pages.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  RegisterView({Key? key}) : super(key: key);
  
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  final bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.only(right: 28, left: 28, bottom: 50),
          children: [
            const Image(
              height: 240,
              image: AssetImage('assets/images/movie-apps-logo-no-bg.png'),
            ),
            Card(
              elevation: 0,
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
                        "Register",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        autofocus: true,
                        controller: controller.namaController,
                        cursorColor: Colors.blue,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Nama",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Nama harus diisi!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: controller.emailController,
                        cursorColor: Colors.blue,
                        keyboardType: TextInputType.text,
                        obscureText: _secureText,
                        decoration: const InputDecoration(
                          hintText: "Email",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Email harus diisi!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: controller.passwordController,
                        cursorColor: Colors.blue,
                        keyboardType: TextInputType.text,
                        obscureText: _secureText,
                        decoration: const InputDecoration(
                          hintText: "Password",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password harus diisi!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: controller.confirmPasswordController,
                        cursorColor: Colors.blue,
                        keyboardType: TextInputType.text,
                        obscureText: _secureText,
                        decoration: const InputDecoration(
                          hintText: "Confirm Password",
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Confirm Password harus diisi!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        // ignore: sort_child_properties_last
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 18, vertical: 10),
                          child: Text(
                            'Register',
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          // primary: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            
                          }
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
                  "Sudah Punya Akun? ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: const Text(
                    'Login',
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
