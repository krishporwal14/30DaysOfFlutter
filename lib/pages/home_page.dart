// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:test/models/catalog.dart';
import 'package:test/widgets/drawer.dart';
import 'package:test/widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
  final int days = 30;
  final String name = "Krish";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catalog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
