import 'package:BytBank/models/contact.dart';
import 'package:sqflite/sqflite.dart';
import 'package:BytBank/database/app_database.dart';

class ContactDao {
  static const String tableSql = 'CREATE TABLE  $_tableName ('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_account_number INTEGER'
      ')';
  static const String _tableName = 'contatos';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _account_number = 'account_number';
  
  Future<int> save(Contact contact) async {
    final Database db = await getDataBase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_name] = contact.name;
    contactMap[_account_number] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contatos = _toList(result);
    return contatos;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contatos = List();
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_id],
        row[_name],
        row[_account_number],
      );
      contatos.add(contact);
    }
    return contatos;
  }
}
