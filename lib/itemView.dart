import 'package:flutter/material.dart';
import 'package:todo/itemEdit.dart';
import 'package:todo/itemList.dart';
import 'package:todo/menu.dart';

class ItemView extends StatefulWidget {
  var _id;
  var _nome;
  var _quantidade;
  var _preco;
  var _img;

  ItemView(id, nome, quantidade, preco, img) {
    this._img = img;
    this._id = id;
    this._quantidade = quantidade;
    this._preco = preco;
    this._nome = nome;
  }
  @override
  State<StatefulWidget> createState() => _ItemViewState(
      this._id, this._nome, this._quantidade, this._preco, this._img);
}

class _ItemViewState extends State<ItemView> {
  var _id;
  var _nome;
  var _quantidade;
  var _preco;
  var _img;

  _ItemViewState(id, nome, quantidade, preco, img) {
    this._img = img;
    this._id = id;
    this._quantidade = quantidade;
    this._preco = preco;
    this._nome = nome;
  }

  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    this._context = context;
    return WillPopScope(
      onWillPop: () {
        _excluirItem(_id);
      },
      child: Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Text("NAJA",
              style: TextStyle(
                fontSize: 30,
                fontFamily: "Arial Black",
                color: Colors.orange,
              )),
          centerTitle: true,
          backgroundColor: Colors.black,
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Voltar",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.orange,
                ),
              ),
              onPressed: _voltar,
            )
          ],
        ),
        backgroundColor: Colors.orange,
        body: new Container(
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          width: 600,
          height: 500,
          child: new Material(
            borderRadius: new BorderRadius.circular(6.0),
            elevation: 2.0,
            child: _getListTile(),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.mode_edit,
                  color: Colors.orange,
                ),
                onPressed: () {
                  _editarItem(_id, _nome, _quantidade, _preco, _img);
                },
              ),
              title: Text(
                "Editar",
                style: TextStyle(color: Colors.orange),
              ),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  _excluirItem(_id);
                },
                icon: Icon(
                  Icons.delete_outline,
                  color: Colors.orange,
                ),
              ),
              title: Text(
                "Excluir",
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
          backgroundColor: Colors.black,
        ),
      ),
    );
  }

  Widget _getListTile() {
    // Foi adicionado dentro de Container para adicionar altura fixa.
    return new Material(
      borderRadius: new BorderRadius.circular(6.0),
      elevation: 2.0,
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            child: FadeInImage.assetNetwork(
              placeholder: '',
              image: _img,
              fit: BoxFit.cover,
              width: 250.0,
              height: 250.0,
            ),
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
          ),
          _getColumText(_nome, _quantidade, _preco),
        ],
      ),
      color: _getCorFundo(_quantidade),
    );
  }

  void _voltar() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => ItemList()),
    );
  }

  void _editarItem(id, nome, quantidade, preco, img) {
    Navigator.pop(
      context,
      MaterialPageRoute(
          builder: (context) => ItemEdit(id, nome, quantidade, preco, img)),
    );
  }

  Future _excluirItem(id) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Tem Certeza que você quer Excluir o Item?"),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            FlatButton(
              child: Text("Sim"),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}

Widget _getColumText(nome, quantidade, preco) {
  return new Expanded(
      child: new Container(
    margin: new EdgeInsets.all(10.0),
    child: new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        _getNomeWidget(nome, quantidade),
        _getQuantidadeWidget(quantidade),
        _getPrecoWidget(preco, quantidade)
      ],
    ),
  ));
}

Widget _getNomeWidget(String curencyName, String quantidade) {
  return new Container(
    child: new Text(
      curencyName,
      maxLines: 1,
      style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 50.0,
          color: _getCorLetra(quantidade)),
    ),
  );
}

Widget _getPrecoWidget(String preco, String quantidade) {
  String precoFormatado = 'R\$ ' + preco;
  return new Container(
    margin: new EdgeInsets.only(top: 5.0),
    child: new Text(
      precoFormatado,
      style: new TextStyle(fontSize: 40.0, color: _getCorLetra(quantidade)),
    ),
  );
}

Widget _getQuantidadeWidget(String quantidade) {
  String quantidadeFormatada = quantidade + " unidades";
  return new Text(
    quantidadeFormatada,
    style: new TextStyle(color: _getCorLetra(quantidade), fontSize: 30.0),
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
