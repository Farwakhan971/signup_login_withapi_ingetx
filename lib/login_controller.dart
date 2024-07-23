import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
    final EmailController = TextEditingController().obs;
    final PasswordController = TextEditingController().obs;
    RxBool loading = false.obs;

    void LoginApi() async {
        loading.value = true;
        try {
            final response = await http.post(
                Uri.parse("https://reqres.in/api/login"),
                body: {
                    "email": EmailController.value.text,
                    "password": PasswordController.value.text,
                },
            );

            var data = jsonDecode(response.body);
            print('Status Code: ${response.statusCode}');
            print('Response Data: $data');

            if (response.statusCode == 200) {
                loading.value = false;
                Get.snackbar('Login Successful', 'Congratulations');
            } else {
                loading.value = false;
                String errorMessage = data['error'] ?? 'Unknown error';
                Get.snackbar('Login Failed', errorMessage);
            }
        } catch (e) {
            loading.value = false;
            Get.snackbar('Error', e.toString());
        }
    }
}
