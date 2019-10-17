import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:todo/addItem.dart';
import 'package:todo/itemList.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var url = 'https://najaweb.herokuapp.com/authenticate';
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

  Future _getToken(email, senha) async {
    Map data = {"email": email, "password": senha};
    var body = json.encode(data);

    var token;

    try {
      http.Response response = await http.post(url, body: body, headers: {
        "Content-Type": "application/json",
      });
      const JsonDecoder decoder = const JsonDecoder();
      token = decoder.convert(response.body);
      return token;
    } on Exception catch (_) {
      return '';
    }
  }

  _entrar(email, senha) async {
    var token = await _getToken(email, senha);
    if (token == '') {
      print("deu errado");
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ItemList(token)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        _entrar(emailController.text, passwordController.text);
                      }
                    },
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.orange, fontSize: 25.0),
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
