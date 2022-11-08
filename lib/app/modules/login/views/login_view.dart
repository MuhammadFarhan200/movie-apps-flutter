import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:movie_apps_flutter/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final bool _secureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        "Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 18),
                      TextFormField(
                        controller: controller.emailController,
                        cursorColor: Colors.blue,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          hintText: "Email",
                        ),
                         validator: (emailValue) {
                            if (emailValue!.isEmpty) {
                              return 'Please enter your email';
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
                        validator: (passwordValue) {
                            if (passwordValue!.isEmpty) {
                              return 'Please enter your password';
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
                            'Login',
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
                            controller.login();
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
                  "Tidak Punya Akun? ",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed(Routes.REGISTER);
                  },
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
