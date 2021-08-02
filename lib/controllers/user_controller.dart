
import 'package:flutter/material.dart';
import 'package:fruta_delivery_app/models/user_model.dart';
import 'package:fruta_delivery_app/screens/home/home_screen.dart';
import 'package:fruta_delivery_app/screens/user/login_screen.dart';
import 'package:fruta_delivery_app/utils/showLoading.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  Rx<UserModel> userModel = UserModel("1","cliente@email.com", "Cliente").obs;

  void login() async{
    //this.email.text.trim();
    //password.text.trim();
    showLoadingLogin();
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(() => HomeScreen());
    });
  }

  void logout() async{

  }
}