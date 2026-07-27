import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:vendas_app/src/models/category_model.dart';

import 'category_local_datasource.dart';

class CategoryHiveLocalDatasource implements CategoryLocalDatasource {
  final String _boxName = 'category_box';

  Future<Box<String>> _getBox() async {
    if (Hive.isBoxOpen(_boxName)) {
      return Hive.box<String>(_boxName);
    }
    return await Hive.openBox<String>(_boxName);
  }

  @override
  Future<List<CategoryModel>> getAll() async {
    final box = await _getBox();

    return box.values.map((jsonString) {
      final map = jsonDecode(jsonString);

      return CategoryModel(
        id: map['id'],
        name: map['name'],
      );
    }).toList();
  }

  @override
  Future<void> add(CategoryModel category) async {
    final box = await _getBox();

    final categoryMap = {
      'id': category.id,
      'name': category.name,
    };

    await box.put(category.id, jsonEncode(categoryMap));
  }

  @override
  Future<void> update(CategoryModel category) async {
    final box = await _getBox();

    final categoryMap = {
      'id': category.id,
      'name': category.name,
    };

    await box.put(category.id, jsonEncode(categoryMap));
  }

  @override
  Future<void> delete(String id) async {
    final box = await _getBox();
    await box.delete(id);
  }
}