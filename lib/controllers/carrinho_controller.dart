import 'dart:math';

import 'package:fruta_delivery_app/constants/controllers.dart';
import 'package:fruta_delivery_app/constants/firebase.dart';
import 'package:fruta_delivery_app/models/carrinho_item_model.dart';
import 'package:fruta_delivery_app/models/pedido_item_model.dart';
import 'package:fruta_delivery_app/models/pedido_model.dart';
import 'package:fruta_delivery_app/models/produto_model.dart';
import 'package:fruta_delivery_app/utils/gerar_pdf_pedido.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';


class CarrinhoController extends GetxController {
  static CarrinhoController instance = Get.find();
  RxDouble _totalValorItens = 0.0.obs;
  RxList<CarrinhoItemModel> _itensCarrinho = RxList<CarrinhoItemModel>([]);

  List<CarrinhoItemModel> get itensCarrinho => _itensCarrinho.value.obs;
  double get totalValorItens => _totalValorItens.value;

  void adicionarItem(ProdutoModel produto){
    CarrinhoItemModel item = CarrinhoItemModel(
      imagem: produto.imagem ?? "",
      nome: produto.nome, quantidade: 1,
       valorUnitario: produto.valorKg ?? 0.0
    );

    if(_itensCarrinho.value.where((itemCarrinho) => itemCarrinho.nome == item.nome).length == 0) {
      _itensCarrinho.value.add(item);
      atualizarValorTotal();
      _itensCarrinho.refresh();
    }
  }

  void removerItem(CarrinhoItemModel itemCarrinho){
      itensCarrinho.forEach((item) {
        if(item.nome == itemCarrinho.nome){
          itensCarrinho.remove(item);
        }
      });
  }

  void aumentarQuantidade(CarrinhoItemModel itemCarrinho){
    _itensCarrinho.forEach((item) {
      if(item.nome == itemCarrinho.nome){
        item.quantidade++;
        _itensCarrinho.refresh();
        atualizarValorTotal();
      }
    });
  }

  void atualizarValorTotal(){
    _totalValorItens.value = 0.0;
    if(_itensCarrinho.length > 0){
      _itensCarrinho.forEach((item) {
        _totalValorItens.value += (item.valorUnitario * item.quantidade);
      });
    }
  }

  void diminuirQuantidade(CarrinhoItemModel itemCarrinho){
    if(itemCarrinho.quantidade == 1){
      _itensCarrinho.refresh();
    }else{
      itemCarrinho.quantidade--;
      _itensCarrinho.refresh();
    }
    atualizarValorTotal();
  }

  void finalizarPedido() async{
    PedidoModel pedido = PedidoModel(
        id: Random().nextInt(100).toString(),
        status: "Em separação",
        dataPedido: DateTime.now().toString(),
        cliente: "Cliente",
        totalValor: this.totalValorItens,
        pedidoItems: []
    );

    List<PedidoItemModel> pedidoItems = [];

    await Future.forEach(_itensCarrinho, (CarrinhoItemModel item) async {
      var produto = produtoController.produtos.where((element) => element.nome == item.nome).first;
      produto.quantidadeEstoque = (produto.quantidadeEstoque - item.quantidade);
      PedidoItemModel pedidoItem = PedidoItemModel();
      pedidoItem.nome = item.nome;
      pedidoItem.quantidade = item.quantidade;
      pedidoItem.valorUnitario = item.valorUnitario;
      pedidoItems.add(pedidoItem);
      await firebaseFirestore.collection('produtos').doc(produto.id).set(produto.toJson());
    });


    pedido.pedidoItems = pedidoItems;

    await firebaseFirestore.collection('pedidos').add(pedido.toJson());

    String pdf = await gerarPDF(pedido);
    print('path $pdf');

    final _result = await OpenFile.open(pdf);

    _itensCarrinho.value = [];
    _itensCarrinho.refresh();
    atualizarValorTotal();
  }

}