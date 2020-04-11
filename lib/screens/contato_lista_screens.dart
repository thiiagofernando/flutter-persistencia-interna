import 'package:flutter/material.dart';

class ContatoLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: ListView(
        children: <Widget>[
          Card(
            child: ListTile(
              title: Text(
                "Thiago",
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
              subtitle: Text(
                "2000",
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
