import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoadingLogin(){
  Get.defaultDialog(
      title: "Entrando...",
      content: CircularProgressIndicator(),
      barrierDismissible: false
  );
}

showLoading(){
  Get.defaultDialog(
      title: "Loading...",
      content: CircularProgressIndicator(),
      barrierDismissible: false
  );
}

dismissLoadingWidget(){
  Get.back();
}