class Item {
  double id;
  String name;
  int qtdStock;
  String image;
  int valor;
  String category;

  Item(
      {this.id,
      this.name,
      this.qtdStock,
      this.image,
      this.valor,
      this.category});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    qtdStock = json['qtdStock'];
    image = json['image'];
    valor = json['valor'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['qtdStock'] = this.qtdStock;
    data['image'] = this.image;
    data['valor'] = this.valor;
    data['category'] = this.category;
    return data;
  }
}
