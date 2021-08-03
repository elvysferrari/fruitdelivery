import 'package:flutter/material.dart';
import 'package:fruta_delivery_app/constants/controllers.dart';
import 'package:fruta_delivery_app/widgets/carrinho_widget.dart';
import 'package:fruta_delivery_app/widgets/produtos_widget.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Fruta Delivery'),
          actions: [
            GestureDetector(
              onTap: (){
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) => Container(
                    color: Colors.white,
                    child: CarrinhoWidget()
                  ),
                );

              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: Icon(Icons.shopping_cart),
                      alignment: Alignment.centerLeft,
                    ),
                    Obx(() => carrinhoController.itensCarrinho.length  > 0 ?
                     Positioned(
                      right: 12,
                      bottom: 6,
                      child: Container(
                        padding: EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),

                        child: Text(
                            '${carrinhoController.itensCarrinho.length}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          )
                      ),
                     ) : Container()
                    )
                  ],
                ),
              ),
            )
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

