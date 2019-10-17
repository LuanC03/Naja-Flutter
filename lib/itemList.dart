import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:todo/itemApi.dart';
import 'package:todo/menu.dart';
import 'package:todo/models/item.dart';
import 'package:http/http.dart' as http;

class ItemList extends StatefulWidget {
  var _token;
  ItemList(token) {
    this._token = token;
  }
  @override
  _ItemListPageState createState() => new _ItemListPageState(this._token);
}

class _ItemListPageState extends State<ItemList> {
  var url = 'https://najaweb.herokuapp.com/';
  List _news = new List();
  var repository = new ItensApi();
  var _token;

  _ItemListPageState(token) {
    this._token = token;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      ),
      backgroundColor: Colors.orange,
      body: new Container(
        child: _getListViewWidget(),
      ),
    );
  }

  @override
  void initState() {
    loadItens();
  }

  Widget _getListViewWidget() {
    var list = new ListView.builder(
        itemCount: _news.length,
        padding: new EdgeInsets.only(top: 5.0),
        itemBuilder: (context, index) {
          return _news[index];
        });

    return list;
  }

  loadItens() async {
    List result = await _getItens();

    setState(() {
      result.forEach((i) {
        var item = new Item(
            _token,
            i['_id'],
            /*i['url_img']*/ "https://pbs.twimg.com/profile_images/507251035929190400/BDUL3Uzt_400x400.png",
            i['nome_item'],
            i['quantidade_item'].toString(),
            i['valor'].toString(),
            i['categoria_item']);
        _news.add(item);
      });
    });
  }

  Future _getItens() async {
    var token;

    try {
      http.Response response = await http.get(url, headers: {
        "Content-Type": "application/json",
      });
      const JsonDecoder decoder = const JsonDecoder();
      var responseBody = decoder.convert(response.body);
      print(responseBody);
      return responseBody;
    } on Exception catch (_) {
      return '';
    }
  }
}
