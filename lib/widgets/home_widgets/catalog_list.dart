// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test/models/catalog.dart';
import 'package:test/pages/home_detail_page.dart';
import 'package:test/widgets/home_widgets/catalog_item.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return !context.isMobile 
    ? GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(
                  catalog: catalog
                ),
              ),
            ),
            child: CatalogItem(catalog: catalog)
          );
        })
    : ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          return InkWell(
            onTap: () => Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(
                  catalog: catalog
                ),
              ),
            ),
            child: CatalogItem(catalog: catalog)
          );
        });
  }
}