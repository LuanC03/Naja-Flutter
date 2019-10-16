import 'package:flutter/material.dart';

class ItemView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _resetFields() {
    nomeController.text = "";
    valorController.text = "";
    imageController.text = "";
    quantidadeController.text = "";
    setState(() {
      _formKey = GlobalKey<FormState>();
    });
  }

  void _cadastrar(nome, valor, imagem, quantidade) {}

  void _showMenu() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            color: Colors.orange,
          ),
          onPressed: _showMenu,
        ),
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
              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Container(
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _cadastrar(nomeController, valorController,
                            imageController, quantidadeController);
                      }
                    },
                    child: Text(
                      "Cadastrar Item",
                      style: TextStyle(color: Colors.orange, fontSize: 25.0),
                    ),
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
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
              onPressed: () {},
            ),
            title: Text(
              "Editar",
              style: TextStyle(color: Colors.orange),
            ),
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {},
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
      // floatingActionButton: FloatingActionButton(
      // onPressed: () => {},
      //tooltip: 'Editar Item',
      //child: const Icon(Icons.mode_edit),
      //backgroundColor: Colors.black,
      //),
    );
  }
}
