import 'package:flutter/material.dart';
import 'package:fruta_delivery_app/constants/controllers.dart';
import 'package:fruta_delivery_app/widgets/texto_padrao.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'item_carrinho_widget.dart';

class CarrinhoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: TextoPadrao(
                text: "Carrinho",
                size: 24,
                weight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Obx(()=>Column(
              children: carrinhoController.itensCarrinho
                  .map((itemCarrinho) => ItemCarrinhoWidget(carrinhoItem: itemCarrinho,))
                  .toList(),
            )),
          ],
        ),
        Positioned(
            bottom: 30,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                child: Obx(() =>
                    GestureDetector(
                      onTap: (){
                        carrinhoController.finalizarPedido();
                        Navigator.of(context).pop();
                      },
    child: PhysicalModel(
    color: Colors.grey.withOpacity(.4),
    elevation: 2,
    borderRadius: BorderRadius.circular(20),
    child: Container(
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Colors.red[400],
    ),
    child: Container(
    margin: EdgeInsets.all(14),
    alignment: Alignment.center,
    child: TextoPadrao(
    text: "Finalizar - Total (R\$ ${carrinhoController.totalValorItens.toStringAsFixed(2)})",
    color:  Colors.white,
    size: 22,
    weight: FontWeight.normal,
    ),
    )
    ),
    ),
                    )

                   )
            ))
      ],
    );
  }
}
