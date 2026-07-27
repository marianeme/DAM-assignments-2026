import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:vendas_app/src/models/client_model.dart';

import 'client_local_datasource.dart';

class ClientHiveLocalDatasource implements ClientLocalDatasource {
  final String _boxName = 'client_box';

  Future<Box<String>> _getBox() async {
    if (Hive.isBoxOpen(_boxName)) {
      return Hive.box<String>(_boxName);
    }
    return await Hive.openBox<String>(_boxName);
  }

  @override
  Future<List<ClientModel>> getAll() async {
    final box = await _getBox();

    return box.values.map((jsonString) {
      final map = jsonDecode(jsonString);

      return ClientModel(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        phone: map['phone'],
      );
    }).toList();
  }

  @override
  Future<void> add(ClientModel client) async {
    final box = await _getBox();

    final clientMap = {
      'id': client.id,
      'name': client.name,
      'email': client.email,
      'phone': client.phone,
    };

    await box.put(client.id, jsonEncode(clientMap));
  }

  @override
  Future<void> update(ClientModel client) async {
    final box = await _getBox();

    final clientMap = {
      'id': client.id,
      'name': client.name,
      'email': client.email,
      'phone': client.phone,
    };

    await box.put(client.id, jsonEncode(clientMap));
  }

  @override
  Future<void> delete(String id) async {
    final box = await _getBox();

    await box.delete(id);
  }
}