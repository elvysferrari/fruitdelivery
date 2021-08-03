import 'package:flutter/material.dart';
import 'constants/firebase.dart';
import 'package:get/get.dart';

import 'controllers/carrinho_controller.dart';
import 'controllers/pedido_controller.dart';
import 'controllers/produto_controller.dart';
import 'controllers/user_controller.dart';
import 'screens/user/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value){
    Get.put(PedidoController());
    Get.put(UserController());
    Get.put(ProdutoController());
    Get.put(CarrinhoController());
  });

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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


