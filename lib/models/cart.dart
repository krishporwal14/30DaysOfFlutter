// ignore_for_file: unnecessary_null_comparison, unused_field, non_constant_identifier_names

import 'package:test/core/store.dart';
import 'package:test/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
  // Catalog field
  late CatalogModel _catalog;

  // Collection of the IDs
  final List<int> _itemIds = [];

  // Get catalog
  CatalogModel get catalog => _catalog;

  // Set catalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get item in the cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add item in list
  void add(Item item) {
    _itemIds.add(item.id);
  }

  // Remove item in list
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation {
  final Item item;

  AddMutation(this.item);
  
  @override
  perform() {
    (store as MyStore).cart._itemIds.add(item.id);
  }
}


class RemoveMutation extends VxMutation {
  final Item item;

  RemoveMutation(this.item);
  
  @override
  perform() {
    (store as MyStore).cart._itemIds.remove(item.id);
  }
}
