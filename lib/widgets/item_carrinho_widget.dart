import 'package:flutter/material.dart';
import 'package:fruta_delivery_app/constants/controllers.dart';
import 'package:fruta_delivery_app/models/carrinho_item_model.dart';
import 'package:fruta_delivery_app/widgets/texto_padrao.dart';

class ItemCarrinhoWidget extends StatefulWidget {
  final CarrinhoItemModel carrinhoItem;

  const ItemCarrinhoWidget({Key? key,required this.carrinhoItem}) : super(key: key);

  @override
  _ItemCarrinhoWidgetState createState() => _ItemCarrinhoWidgetState();
}

class _ItemCarrinhoWidgetState extends State<ItemCarrinhoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        Padding(
          padding:
          const EdgeInsets.all(8.0),
          child: Image.network(
            widget.carrinhoItem.imagem,
            width: 80,
          ),
        ),
        Expanded(
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Container(
                    padding: EdgeInsets.only(left: 14),
                    child: TextoPadrao(
                      text: widget.carrinhoItem.nome,
                    )),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.chevron_left),
                        onPressed: () {
                          carrinhoController.diminuirQuantidade(widget.carrinhoItem);
                        }),
                    Padding(
                      padding:
                      const EdgeInsets.all(
                          8.0),
                      child:
                      TextoPadrao(
                        text: widget.carrinhoItem.quantidade.toString(),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.chevron_right),
                        onPressed: () {
                          carrinhoController.aumentarQuantidade(widget.carrinhoItem);
                        }),
                  ],
                )
              ],
            )),
        Padding(
          padding:
          const EdgeInsets.all(14),
          child: TextoPadrao(
            text: "R\$ ${widget.carrinhoItem.valorUnitario}",
            size: 22,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
