class CarrinhoItemModel {

  String? nome;
  late int quantidade;
  late double valorUnitario;
  late String imagem;

  CarrinhoItemModel({this.nome, this.imagem = "", this.quantidade = 1, this.valorUnitario = 0 });

  CarrinhoItemModel.fromMap(Map<String, dynamic> data) {
    this.nome = data['nome'];
    this.quantidade = data["quantidade"];
    this.valorUnitario = data["valorUnitario"];
    this.imagem = data["imagem"];
  }

  Map<String, dynamic> toJson() => {
    'nome': this.nome,
    'quantidade': this.quantidade,
    'valorUnitario': this.valorUnitario,
    'imagem': this.imagem
  };
}