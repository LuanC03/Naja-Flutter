import 'package:flutter/material.dart';
import 'package:todo/ItemApi.dart';
import 'package:todo/menu.dart';
import 'package:todo/models/item.dart';

class ItemList extends StatefulWidget {
  final state = new _ItemListPageState();

  @override
  _ItemListPageState createState() => state;
}

class _ItemListPageState extends State<ItemList> {
  List _news = new List();
  var repository = new ItensApi();

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
    List result = await repository.loadAllItens();

    setState(() {
      result.forEach((i) {
        var item = new Item(i['_id'], i['url_img'], i['nome'], i['quantidade'],
            i['preco'], i['categoria']);
        _news.add(item);
      });
    });
  }
}
