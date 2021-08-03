import 'package:flutter/material.dart';
import 'package:fruta_delivery_app/constants/controllers.dart';
import 'package:fruta_delivery_app/models/produto_model.dart';
import 'package:fruta_delivery_app/widgets/texto_padrao.dart';
import 'package:get/get.dart';

class ProdutoWidget extends StatelessWidget {
  final ProdutoModel produto;
  const ProdutoWidget({Key? key, required this.produto}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Stack(
                  children: [

                    Image.network(
                      produto.imagem!,
                      width: double.infinity,
                    ),
                  ]
                ),
                ),
          ),
          TextoPadrao(
            text: produto.nome,
            size: 18,
            weight: FontWeight.bold,
          ),
          TextoPadrao(
            text: produto.descricao!,
            color: Colors.grey,
          ),
          SizedBox(
            height: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topCenter,
                  child: Text(
                    'Em estoque: ${produto.quantidadeEstoque} kg',
                    style: TextStyle(
                      fontSize: 12
                    ),
                  ),

              ),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: TextoPadrao(
                  text: "R\$ ${produto.valorKg}",
                  size: 22,
                  weight: FontWeight.bold,
                ),
              ),
              IconButton(
                  icon: Icon(Icons.add_shopping_cart, size: 30, color: Colors.green,),
                  disabledColor: Colors.grey,
                  onPressed: () {
                    produto.quantidadeEstoque > 0 ?
                    carrinhoController.adicionarItem(produto)
                    : Get.snackbar("${produto.nome}", "Sem estoque");;
                  })
            ],
          ),
        ],
      ),
    );
  }
}