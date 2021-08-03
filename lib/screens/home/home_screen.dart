import 'package:flutter/material.dart';
import 'package:fruta_delivery_app/constants/controllers.dart';
import 'package:fruta_delivery_app/widgets/carrinho_widget.dart';
import 'package:fruta_delivery_app/widgets/produtos_widget.dart';
import 'package:get/get.dart';
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
              onTap: () {
                carrinhoController.itensCarrinho.length > 0 ?
                showBarModalBottomSheet(
                  context: context,
                  builder: (context) =>
                      Container(color: Colors.white, child: CarrinhoWidget()),
                ) : Get.snackbar("Carrinho vazio", "Por favor adicione um item");
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Stack(
                  children: <Widget>[
                    Align(
                      child: Icon(Icons.shopping_cart),
                      alignment: Alignment.centerLeft,
                    ),
                    Obx(() => carrinhoController.itensCarrinho.length > 0
                        ? Positioned(
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
                                )),
                          )
                        : Container())
                  ],
                ),
              ),
            )
          ],
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:8.0, left: 10.0),
              child: Container(
                height: 50,
                child: TextFormField(
                  controller: produtoController.textoProcura,
                  onChanged: (String text) {
                    produtoController.filtrarProduto();
                  },
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: "Procurar",
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                color: Colors.white30,
                child: ProdutosWidget(),
              ),
            ),
          ],
        ));
  }
}
