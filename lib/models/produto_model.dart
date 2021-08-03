class ProdutoModel {

  late String id;
  late String nome;
  late String? descricao;
  late String? imagem;
  late int quantidadeEstoque;
  late double? valorKg;

  ProdutoModel(this.id, this.nome, { this.descricao, this.imagem, this.quantidadeEstoque = 0, this.valorKg});

  ProdutoModel.fromMap(Map<String, dynamic> json){
    this.id = json['id'];
    this.nome = json['nome'];
    this.descricao = json['descricao'];
    this.imagem = json['imagem'];
    this.quantidadeEstoque = json['quantidadeEstoque'];
    this.valorKg = json['valorKg'];
  }


  Map<String, dynamic> toJson() => {
    'id': this.id,
    'nome': this.nome,
    'descricao': this.descricao,
    'imagem': this.imagem,
    'quantidadeEstoque': this.quantidadeEstoque,
    'valorKg': this.valorKg
  };

}