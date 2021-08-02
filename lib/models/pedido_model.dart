class PedidoModel {

  late int id;
  late String cliente;

  PedidoModel(this.id, this.cliente);

  PedidoModel.fromMap(Map<String, dynamic> json){
      this.id = json['id'];
      this.cliente = json['name'];
  }

  Map<String, dynamic> toJson() => {'id': id, 'cliente': cliente };
}