import 'package:flutter/material.dart';
import 'package:fruta_delivery_app/controllers/pedido_controller.dart';
import 'package:fruta_delivery_app/screens/user/login_screen.dart';
import 'constants/firebase.dart';
import 'package:get/get.dart';

import 'controllers/user_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value){
    Get.put(PedidoController());
    Get.put(UserController());
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruta Delivery',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}


