import 'package:BytBank/models/contact.dart';
import 'package:flutter/material.dart';

class ContatoFormulario extends StatefulWidget {
  @override
  _ContatoFormularioState createState() => _ContatoFormularioState();
}

class _ContatoFormularioState extends State<ContatoFormulario> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Contato"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome Completo',
              ),
              style: TextStyle(
                fontSize: 24.0,
              ),
              keyboardType: TextInputType.text,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  labelText: 'Número da Conta',
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
                keyboardType: TextInputType.text,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: RaisedButton(
                  color: Colors.green[900],
                  child: Text("Salvar"),
                  onPressed: () {
                    final String name = _nameController.text;
                    final int acccount =
                        int.tryParse(_accountNumberController.text);
                    final Contact newContact = Contact(name, acccount);
                    Navigator.pop(context, newContact);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}