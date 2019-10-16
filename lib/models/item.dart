/*class Item {
  String name;
  String qtdStock;
  String image;
  String valor;
  String category;

  Item({this.name, this.qtdStock, this.image, this.valor, this.category});

  Item.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    qtdStock = json['qtdStock'];
    image = json['image'];
    valor = json['valor'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['qtdStock'] = this.qtdStock;
    data['image'] = this.image;
    data['valor'] = this.valor;
    data['category'] = this.category;
    return data;
  }
}*/
import 'package:flutter/material.dart';
import 'package:todo/itemView.dart';

class Item extends StatelessWidget {
  var _id;
  var _img;
  var _nome;
  var _quantidade;
  var _preco;
  var _categoria;

  Item(this._id, this._img, this._nome, this._quantidade, this._preco,
      this._categoria);

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;

    //Foi adicionado dentro de Container para adicionar margem no item
    return new Container(
      margin: const EdgeInsets.only(
          left: 10.0, right: 10.0, bottom: 10.0, top: 0.0),
      child: new Material(
        borderRadius: new BorderRadius.circular(6.0),
        elevation: 2.0,
        child: _getListTile(),
      ),
    );
  }

  Widget _getListTile() {
    // Foi adicionado dentro de Container para adicionar altura fixa.
    return new Material(
      borderRadius: new BorderRadius.circular(6.0),
      elevation: 2.0,
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new FadeInImage.assetNetwork(
            placeholder: '',
            image: _img,
            fit: BoxFit.cover,
            width: 95.0,
            height: 95.0,
          ),
          _getColumText(_id, _nome, _quantidade, _preco),
        ],
      ),
      color: _getCorFundo(_quantidade),
    );
  }

  Widget _getColumText(id, nome, quantidade, preco) {
    return new Expanded(
        child: new Container(
      margin: new EdgeInsets.all(10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getNomeWidget(_id, _nome, _quantidade),
          _getQuantidadeWidget(_quantidade),
          _getPrecoWidget(_preco, _quantidade)
        ],
      ),
    ));
  }

  Widget _getNomeWidget(num id, String curencyName, String quantidade) {
    return new Row(
      children: <Widget>[
        new Text(
          curencyName,
          maxLines: 1,
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: _getCorLetra(quantidade)),
        ),
        RaisedButton(
          onPressed: () {
            Navigator.push(
              _context,
              MaterialPageRoute(builder: (_context) => ItemView(id)),
            );
          },
          child: Text(
            "Entrar",
            style: TextStyle(color: Colors.orange, fontSize: 25.0),
          ),
          color: Colors.black,
        )
      ],
    );
  }

  Widget _getPrecoWidget(String preco, String quantidade) {
    String precoFormatado = 'R\$ ' + preco;
    return new Container(
      margin: new EdgeInsets.only(top: 5.0),
      child: new Text(
        precoFormatado,
        style: new TextStyle(fontSize: 20.0, color: _getCorLetra(quantidade)),
      ),
    );
  }

  Widget _getQuantidadeWidget(String quantidade) {
    String quantidadeFormatada = quantidade + " unidades";
    return new Text(
      quantidadeFormatada,
      style: new TextStyle(color: _getCorLetra(quantidade), fontSize: 15.0),
    );
  }

  _getCorFundo(quantidade) {
    int qtd = int.parse(quantidade);
    if (qtd == 0) {
      return Colors.red;
    } else if (qtd > 0 && qtd <= 10) {
      return Colors.yellow;
    } else {
      return Colors.black;
    }
  }

  _getCorLetra(String quantidade) {
    int qtd = int.parse(quantidade);
    if (qtd > 0 && qtd <= 10) {
      return Colors.black;
    } else {
      return Colors.white;
    }
  }
}
