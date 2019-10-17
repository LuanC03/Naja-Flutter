import 'package:flutter/material.dart';
import 'package:todo/itemView.dart';

class ItemEdit extends StatefulWidget {
  var _id;
  var _nome;
  var _quantidade;
  var _preco;
  var _img;
  var _token;

  ItemEdit(token, id, nome, quantidade, preco, img) {
    this._img = img;
    this._id = id;
    this._quantidade = quantidade;
    this._preco = preco;
    this._nome = nome;
    this._token = token;
  }

  @override
  State<StatefulWidget> createState() => _ItemEditState(this._token, this._id,
      this._nome, this._quantidade, this._preco, this._img);
}

class _ItemEditState extends State<ItemEdit> {
  var _id;
  var _nome;
  var _quantidade;
  var _preco;
  var _img;
  var _token;

  TextEditingController nomeController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();

  _ItemEditState(token, id, nome, quantidade, preco, img) {
    this._token = token;
    this._img = img;
    this._id = id;
    this._quantidade = quantidade;
    this._preco = preco;
    this._nome = nome;
    nomeController.text = nome;
    valorController.text = preco;
    imageController.text = img;
    quantidadeController.text = quantidade;
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    nomeController.text = _nome;
    valorController.text = _preco;
    imageController.text = _img;
    quantidadeController.text = _quantidade;
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        _cancelarEdicao();
      },
      child: Scaffold(
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
            IconButton(
              icon: Icon(
                Icons.refresh,
                color: Colors.orange,
              ),
              onPressed: _resetFields,
            )
          ],
        ),
        backgroundColor: Colors.orange,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Icon(Icons.fiber_new, size: 120.0, color: Colors.black),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Digite o Nome do Item",
                      labelStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                  controller: nomeController,
                  validator: (nomeItem) {
                    if (nomeItem.isEmpty) {
                      return "Insira o Nome do Item!";
                    }
                  },
                ), //
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Digite o Valor do Item",
                      labelStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                  controller: valorController,
                  validator: (valorItem) {
                    if (valorItem.isEmpty) {
                      return "Insira o Valor do Item!";
                    } else if (double.parse(valorItem) <= 0) {
                      return "Insira um Valor Valido!";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Digite a Quantidade do Item",
                      labelStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                  controller: quantidadeController,
                  validator: (quantidadeItem) {
                    if (quantidadeItem.isEmpty) {
                      return "Insira o Quantidade do Item!";
                    } else if (double.parse(quantidadeItem) <= 0) {
                      return "Insira uma Quantidade Valido!";
                    }
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: "Digite o Imagem do Item",
                      labelStyle: TextStyle(color: Colors.black)),
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 25.0),
                  controller: imageController,
                  validator: (imageItem) {
                    if (imageItem.isEmpty) {
                      return "Insira a Imagem do Item!";
                    }
                  },
                ),
                Divider(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconButton(
                icon: Icon(
                  Icons.save,
                  color: Colors.orange,
                ),
                onPressed: () {
                  _salvarEdicao(nomeController.text, valorController.text,
                      imageController.text, quantidadeController.text, _id);
                },
              ),
              title: Text(
                "Salvar",
                style: TextStyle(color: Colors.orange),
              ),
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  _cancelarEdicao();
                },
                icon: Icon(
                  Icons.do_not_disturb,
                  color: Colors.orange,
                ),
              ),
              title: Text(
                "Cancelar",
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
          backgroundColor: Colors.black,
        ),
      ),
    );
  }

  Future _cancelarEdicao() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Cancelar Edição?"),
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

  void _salvarEdicao(
      String nome, String valor, String img, String quantidade, id) {
    print("nome: " + nome);
    print("valor: " + valor);
    print("img: " + img);
    print("qtd: " + quantidade);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            ItemView(_token, "1245", nome, quantidade, valor, img),
      ),
    );
  }
}
