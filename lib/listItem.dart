import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
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
          backgroundColor: Colors.black),
      backgroundColor: Colors.orange,
      body: Column(),
    );
  }
}
