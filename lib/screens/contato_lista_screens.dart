import 'package:BytBank/database/dao/contact_dao.dart';
import 'package:BytBank/models/contact.dart';
import 'package:BytBank/screens/contato_formulario_screens.dart';
import 'package:flutter/material.dart';

class ContatoLista extends StatefulWidget {
  @override
  _ContatoListaState createState() => _ContatoListaState();
}

class _ContatoListaState extends State<ContatoLista> {
  @override
  final ContactDao _dao =  ContactDao();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: FutureBuilder<List<Contact>>(
          initialData: List(),
          future: _dao.findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text("Carregando...."),
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Contact> listaContatos = snapshot.data;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contact contact = listaContatos[index];
                    return _ContatoItem(contact);
                  },
                  itemCount: listaContatos.length,
                );
                break;
            }
            return Text("Falha no Sistema, feche e abra novamente");
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ContatoFormulario(),
            ),
          );
          setState(() {});
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class _ContatoItem extends StatelessWidget {
  final Contact contact;

  _ContatoItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
