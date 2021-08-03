import 'package:fruta_delivery_app/constants/firebase.dart';
import 'package:fruta_delivery_app/models/produto_model.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

class ProdutoController extends GetxController {
  static ProdutoController instance = Get.find();
  RxList<ProdutoModel> _produtos = RxList<ProdutoModel>([]);

  List<ProdutoModel> get produtos => _produtos.value;

  @override
  onReady() {
    super.onReady();

    _produtos.bindStream(listarPedidos());
    print('produtosw: $_produtos');
  }


  Stream<List<ProdutoModel>> listarPedidos() =>
      firebaseFirestore.collection("produtos").snapshots().map((query) =>
          query.docs.map((item) => ProdutoModel.fromMap(item.data())).toList());


}