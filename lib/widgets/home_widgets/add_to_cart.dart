// ignore_for_file: unused_field, no_leading_underscores_for_local_identifiers, prefer_const_constructors, prefer_const_constructors_in_immutables, unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/core/store.dart';
import 'package:test/models/cart.dart';
import 'package:test/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    super.key,
    required this.catalog,
  });

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    final CatalogModel _catalog = (VxState.store as MyStore).catalog;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all(context.theme.highlightColor),
          shape: MaterialStateProperty.all(StadiumBorder())),
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}
