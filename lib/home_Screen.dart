import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Obx(() => TextFormField(
              controller: loginController.EmailController.value,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Obx(() => TextFormField(
              controller: loginController.PasswordController.value,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            )),
          ),
          SizedBox(height: 50),
          Obx(() => InkWell(
            onTap: () {
              loginController.LoginApi();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10.0),
              ),
              width: 300,
              height: 50,
              child: Center(
                child: loginController.loading.value
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          )),
        ],
      ),
    );
  }
}
