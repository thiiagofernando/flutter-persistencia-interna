import 'package:BytBank/screens/contato_formulario_screens.dart';
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
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(builder: (context) => ContatoFormulario()),
              )
              .then(
                (newContato) => debugPrint(newContato.toString()),
              );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
