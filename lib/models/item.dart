import 'package:flutter/material.dart';
import 'package:todo/itemView.dart';

class Item extends StatelessWidget {
  var _id;
  var _img;
  var _nome;
  var _quantidade;
  var _preco;
  var _categoria;
  var _token;

  Item(this._token, this._id, this._img, this._nome, this._quantidade,
      this._preco, this._categoria);

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
          _getColumText(_nome, _quantidade, _preco),
          RaisedButton(
            onPressed: () {
              Navigator.push(
                _context,
                MaterialPageRoute(
                    builder: (_context) => ItemView(
                        _token, _id, _nome, _quantidade, _preco, _img)),
              );
            },
            child: Text(
              "Ver Item",
              style: TextStyle(
                  color: _getCorLetraBotao(_quantidade), fontSize: 18.0),
            ),
            color: _getCorBotao(_quantidade),
            padding: EdgeInsets.fromLTRB(5.0, 5.0, 5, 5.0),
          ),
        ],
      ),
      color: _getCorFundo(_quantidade),
    );
  }

  Widget _getColumText(nome, quantidade, preco) {
    return new Expanded(
        child: new Container(
      margin: new EdgeInsets.all(10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getNomeWidget(_nome, _quantidade),
          _getQuantidadeWidget(_quantidade),
          _getPrecoWidget(_preco, _quantidade)
        ],
      ),
    ));
  }

  Widget _getNomeWidget(String curencyName, String quantidade) {
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

  _getCorBotao(quantidade) {
    int qtd = int.parse(quantidade);
    if (qtd == 0) {
      return Colors.black;
    } else if (qtd > 0 && qtd <= 10) {
      return Colors.black;
    } else {
      return Colors.orange;
    }
  }

  _getCorLetraBotao(quantidade) {
    int qtd = int.parse(quantidade);
    if (qtd <= 10) {
      return Colors.orange;
    } else {
      return Colors.black;
    }
  }
}
