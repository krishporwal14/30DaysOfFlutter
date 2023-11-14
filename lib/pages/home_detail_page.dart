// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test/models/catalog.dart';
import 'package:test/utils/themes.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog}) : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(MyTheme.darkBlueishColor),
                shape: MaterialStateProperty.all(StadiumBorder())
              ),
              onPressed: () {}, 
              child: "Buy".text.make(),
            ).wh(100, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image)
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  width: context.screenWidth,
                  color: Colors.white,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl4.color(MyTheme.darkBlueishColor).make(),
                      catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                      10.heightBox,
                    ]
                  ).p64(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
