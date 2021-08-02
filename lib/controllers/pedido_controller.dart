import 'package:fruta_delivery_app/constants/firebase.dart';
import 'package:fruta_delivery_app/models/pedido_model.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class PedidoController extends GetxController {
  static PedidoController instance = Get.find();

  List<PedidoModel> pedidos = [];

  Future<void> criarPedido(PedidoModel pedido) async {
    firebaseFirestore.collection("pedidos").add(pedido.toJson());
  }

  Stream<List<PedidoModel>> listarPedidos(String cliente) =>
      firebaseFirestore.collection("pedidos").where('cliente', isEqualTo: cliente).snapshots().map((query) =>
          query.docs.map((item) => PedidoModel.fromMap(item.data())).toList());

}