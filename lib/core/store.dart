import 'package:velocity_x/velocity_x.dart';

import 'package:test/models/cart.dart';
import 'package:test/models/catalog.dart';

class MyStore extends VxStore {
  MyStore() {
    CatalogModel catalog;
    CartModel cart;
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
