import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruta_delivery_app/models/carrinho_item_model.dart';
import 'package:fruta_delivery_app/models/pedido_item_model.dart';

class PedidoModel {

  String? id;
  String? cliente;
  String? dataPedido;
  String? status ;
  double? totalValor ;

  late List<PedidoItemModel> pedidoItems;

  PedidoModel({required this.id, required this.cliente, required this.dataPedido, required this.status, required this.totalValor, required this.pedidoItems});

  PedidoModel.fromMap(Map<String, dynamic> json){
      this.id = json['id'];
      this.cliente = json['cliente'];
      this.dataPedido = json['dataPedido'];
      this.status = json['status'];
      this.totalValor = json['totalValor'];
      this.pedidoItems = _carregarItems(json['pedidoItems'] ?? []);
  }

  List<PedidoItemModel> _carregarItems(List carrinhoFB){
    List<PedidoItemModel> _result = [];
    if(carrinhoFB.length > 0){
      carrinhoFB.forEach((element) {
        _result.add(PedidoItemModel.fromMap(element));
      });
    }
    return _result;
  }

  PedidoModel.fromSnapshot(DocumentSnapshot snapshot){
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    this.id = data['id'];
    this.cliente = data['cliente'];
    this.dataPedido = data['dataPedido'];
    this.status = data['status'];
    this.totalValor = data['totalValor'];
    this.pedidoItems = _carregarItems(data['pedidoItems']);
  }

  Map<String, dynamic> toJson() => {'id': id, 'cliente': cliente, 'dataPedido': dataPedido, 'status': status, 'totalValor': totalValor, 'pedidoItems': pedidoItemsToJson() };

  List pedidoItemsToJson() => pedidoItems.map((item) => item.toJson()).toList();
}