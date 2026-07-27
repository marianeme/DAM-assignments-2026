import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:vendas_app/src/models/product_model.dart';

import 'product_local_datasource.dart';

class ProductHiveLocalDatasource implements ProductLocalDatasource {
  final String _boxName = 'product_box';

  Future<Box<String>> _getBox() async {
    if (Hive.isBoxOpen(_boxName)) {
      return Hive.box<String>(_boxName);
    }
    return await Hive.openBox<String>(_boxName);
  }

  @override
  Future<List<ProductModel>> getAll() async {
    final box = await _getBox();

    return box.values.map((jsonString) {
      final map = jsonDecode(jsonString);

      return ProductModel(
        id: map['id'],
        name: map['name'],
        price: (map['price'] as num).toDouble(),
        imageUrl: map['imageUrl'],
        category: map['category'],
      );
    }).toList();
  }

  @override
  Future<void> add(ProductModel product) async {
    final box = await _getBox();

    final productMap = {
      'id': product.id,
      'name': product.name,
      'price': product.price,
      'imageUrl': product.imageUrl,
      'category': product.category,
    };

    await box.put(product.id, jsonEncode(productMap));
  }

  @override
  Future<void> update(ProductModel product) async {
    final box = await _getBox();

    final productMap = {
      'id': product.id,
      'name': product.name,
      'price': product.price,
      'imageUrl': product.imageUrl,
      'category': product.category,
    };

    await box.put(product.id, jsonEncode(productMap));
  }

  @override
  Future<void> delete(String id) async {
    final box = await _getBox();
    await box.delete(id);
  }
}