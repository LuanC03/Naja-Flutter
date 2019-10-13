import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Item(),
    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe seus dados!";

  void _resetFields() {
    emailController.text = "";
    passwordController.text = "";
    setState(() {
      _infoText = "Informe seus dados!";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _entrar() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NAJA",
            style: TextStyle(fontSize: 30, fontFamily: "Arial Black")),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
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
              Icon(Icons.add_shopping_cart, size: 120.0, color: Colors.black),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Digite Seu Email",
                    labelStyle: TextStyle(color: Colors.black)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                controller: emailController,
                validator: (email) {
                  if (email.isEmpty) {
                    return "Insira seu Email!";
                  }
                },
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Digite Sua Senha",
                    labelStyle: TextStyle(color: Colors.black)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
                controller: passwordController,
                validator: (password) {
                  if (password.isEmpty) {
                    return "Insira sua Senha!";
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
                        _entrar();
                      }
                    },
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AddItem extends StatefulWidget {
  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe os dados do Item!";

  void _resetFields() {
    nomeController.text = "";
    valorController.text = "";
    imageController.text = "";
    quantidadeController.text = "";
    setState(() {
      _infoText = "Informe os dados do Item!";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _cadastrar() {}

  void _showMenu() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _showMenu,
        ),
        title: Text("NAJA",
            style: TextStyle(fontSize: 30, fontFamily: "Arial Black")),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
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
                        _cadastrar();
                      }
                    },
                    child: Text(
                      "Cadastrar Item",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Item extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController valorController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _infoText = "Informe os dados do Item!";

  void _resetFields() {
    nomeController.text = "";
    valorController.text = "";
    imageController.text = "";
    quantidadeController.text = "";
    setState(() {
      _infoText = "Informe os dados do Item!";
      _formKey = GlobalKey<FormState>();
    });
  }

  void _cadastrar() {}

  void _showMenu() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: _showMenu,
        ),
        title: Text("NAJA",
            style: TextStyle(fontSize: 30, fontFamily: "Arial Black")),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
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
                        _cadastrar();
                      }
                    },
                    child: Text(
                      "Cadastrar Item",
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                    ),
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                _infoText,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25.0),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Editar Item',
        child: const Icon(Icons.mode_edit),
        backgroundColor: Colors.black,
      ),
    );
  }
}