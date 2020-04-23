import 'package:BytBank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> criarBanco() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');

    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE  contatos('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER'
          ')');
    }, version: 1);
  });
}

Future<int> salvarContato(Contact contact) {
  return criarBanco().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contatos', contactMap);
  });
}

Future<List<Contact>> buscarTodos() {
  return criarBanco().then((db) {
    return db.query('contatos').then((maps) {
      final List<Contact> contatos = List();
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
          map['id'],
          map['name'],
          map['account_number'],
        );
        contatos.add(contact);
      }
      return contatos;
    });
  });
}
