class PedidoItemModel {

  String? nome;
  late int quantidade;
  late double valorUnitario;

  PedidoItemModel({this.nome, this.quantidade = 1, this.valorUnitario = 0 });

  PedidoItemModel.fromMap(Map<String, dynamic> data) {
    this.nome = data['nome'];
    this.quantidade = data["quantidade"];
    this.valorUnitario = data["valorUnitario"];
  }

  Map<String, dynamic> toJson() => {
    'nome': this.nome,
    'quantidade': this.quantidade,
    'valorUnitario': this.valorUnitario
  };
}