import 'package:flutter/material.dart';
import 'package:fruta_delivery_app/constants/controllers.dart';
import 'package:fruta_delivery_app/widgets/produtos_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Fruta Delivery'),
          actions: [
            IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {})
          ],
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: ListView(
            children: [
              Obx(()=> UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    image: const DecorationImage(
                      image: NetworkImage('https://i.pinimg.com/736x/4b/56/f1/4b56f1299f18c69c5ccfc670b09bc448.jpg'),
                      fit: BoxFit.cover,
                    ),

                  ),
                  accountName: Text(userController.userModel.value.login, style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),),
                  accountEmail: Text(userController.userModel.value.email, style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                  ),))),
              ListTile(
                leading: Icon(Icons.book),
                title: Text("Pedidos"),
                onTap: ()async {
                  pedidoController.listarPedidos(userController.userModel.value.login);
                },
              ),
              ListTile(
                onTap: () {

                },
                leading: Icon(Icons.exit_to_app),
                title: Text("Sair"),
              )
            ],
          ),
        ),
        body: Container(
          color: Colors.white30,
          child: ProdutosWidget(),
        ));
  }
}

