class CarrinhoItemModel {

  late int id;
  late String nome;
  String? descricao;
  int? quantidade;
  double? valorUnitario;

  CarrinhoItemModel({required this.id, required this.nome, this.descricao, this.quantidade, this.valorUnitario });

  CarrinhoItemModel.fromMap(Map<String, dynamic> data) {
    this.id = data['id'];
    this.nome = data['nome'];
    this.descricao = data["descricao"];
    this.quantidade = data["quantidade"];
    this.valorUnitario = data["valorUnitario"];
  }

  Map<String, dynamic> toJson() => {
    'id': this.id,
    'nome': this.nome,
    'descricao': this.descricao,
    'quantidade': this.quantidade,
    'valorUnitario': this.valorUnitario
  };
}