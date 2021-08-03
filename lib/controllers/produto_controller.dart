import 'package:flutter/material.dart';
import 'package:fruta_delivery_app/constants/firebase.dart';
import 'package:fruta_delivery_app/models/produto_model.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class ProdutoController extends GetxController {
  static ProdutoController instance = Get.find();
  RxList<ProdutoModel> _produtos = RxList<ProdutoModel>([]);
  RxList<ProdutoModel> _produtosFiltrados = RxList<ProdutoModel>([]);

  List<ProdutoModel> get produtos => _produtos.value;
  List<ProdutoModel> get produtosFiltrados => _produtosFiltrados.value;
  TextEditingController textoProcura = TextEditingController();

  @override
  onReady() {
    super.onReady();
    _produtos.bindStream(listarPedidos());
    _produtosFiltrados.bindStream(listarPedidos());
  }

  Stream<List<ProdutoModel>> listarPedidos() =>
      firebaseFirestore.collection("produtos").snapshots().map((query) =>
          query.docs.map((item) => ProdutoModel.fromMap(item.data())).toList());

  Stream<List<ProdutoModel>> listarPedidosFiltrados() =>
      firebaseFirestore.collection("produtos").snapshots().map((query) =>
          query.docs.map((item) => ProdutoModel.fromMap(item.data())).toList());

   filtrarProduto(){
    if(this.textoProcura.text.trim() != "") {
      _produtosFiltrados.value = _produtos.where((produto) => produto.nome.toLowerCase().contains(this.textoProcura.text.trim().toLowerCase())).toList();
      _produtosFiltrados.refresh();
    }
    else {
      _produtosFiltrados.value = _produtos.value;
      _produtosFiltrados.refresh();
    }
  }

}