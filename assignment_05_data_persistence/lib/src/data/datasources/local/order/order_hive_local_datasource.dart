import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:vendas_app/src/models/client_model.dart';
import 'package:vendas_app/src/models/order_model.dart';
import 'package:vendas_app/src/models/product_model.dart';

import 'order_local_datasource.dart';

class OrderHiveLocalDatasource implements OrderLocalDatasource {
  final String _boxName = 'order_box';

  Future<Box<String>> _getBox() async {
    if (Hive.isBoxOpen(_boxName)) {
      return Hive.box<String>(_boxName);
    }
    return await Hive.openBox<String>(_boxName);
  }

  @override
  Future<List<OrderModel>> getAll() async {
    final box = await _getBox();

    return box.values.map((jsonString) {
      final map = jsonDecode(jsonString);

      final clientMap = map['client'];
      final client = ClientModel(
        id: clientMap['id'],
        name: clientMap['name'],
        email: clientMap['email'],
        phone: clientMap['phone'],
      );

      final List<dynamic> itemsMapList = map['items'];
      final items = itemsMapList.map((itemMap) {
        final productMap = itemMap['product'];
        return OrderItem(
          quantity: itemMap['quantity'],
          product: ProductModel(
            id: productMap['id'],
            name: productMap['name'],
            price: (productMap['price'] as num).toDouble(),
            imageUrl: productMap['imageUrl'],
            category: productMap['category'],
          ),
        );
      }).toList();

      return OrderModel(
        id: map['id'],
        date: DateTime.parse(map['date']),
        client: client,
        items: items,
      );
    }).toList();
  }

  @override
  Future<void> add(OrderModel order) async {
    final box = await _getBox();

    final orderMap = {
      'id': order.id,
      'date': order.date.toIso8601String(),
      'client': {
        'id': order.client.id,
        'name': order.client.name,
        'email': order.client.email,
        'phone': order.client.phone,
      },
      'items': order.items.map((item) => {
        'quantity': item.quantity,
        'product': {
          'id': item.product.id,
          'name': item.product.name,
          'price': item.product.price,
          'imageUrl': item.product.imageUrl,
          'category': item.product.category,
        }
      }).toList(),
    };

    await box.put(order.id, jsonEncode(orderMap));
  }

  @override
  Future<void> update(OrderModel order) async {
    await add(order);
  }

  @override
  Future<void> delete(String id) async {
    final box = await _getBox();
    await box.delete(id);
  }
}