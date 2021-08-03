import 'package:flutter/material.dart';
import 'package:fruta_delivery_app/constants/controllers.dart';
import 'package:fruta_delivery_app/models/produto_model.dart';
import 'package:fruta_delivery_app/widgets/produto_widget.dart';
import 'package:get/get.dart';

class ProdutosWidget extends StatefulWidget {
  @override
  _ProdutosWidgetState createState() => _ProdutosWidgetState();
}

class _ProdutosWidgetState extends State<ProdutosWidget> {
  @override
  Widget build(BuildContext context) {
    return Obx(()=>GridView.count(
        crossAxisCount: 2,
        childAspectRatio: .60,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 10,
        children: produtoController.produtosFiltrados.map((ProdutoModel produto) {
          return ProdutoWidget(produto: produto,);
        }).toList()));
  }
}
