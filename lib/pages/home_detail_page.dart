// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test/models/catalog.dart';
import 'package:test/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog}) : assert(catalog != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog,).wh(120, 50),
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
            ).h24(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  width: context.screenWidth,
                  color: context.cardColor,
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl4.color(context.theme.colorScheme.secondary).make(),
                      catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                      10.heightBox,
                      "Ea est ipsum voluptua dolor lorem dolores, rebum nonumy ipsum ut sit. No et takimata ea duo, sit labore et ipsum sit sed labore et nonumy. Amet justo ipsum magna at kasd et ut. Accusam ipsum amet invidunt takimata dolore vero. Vero amet ipsum sed gubergren ipsum et, amet kasd.".text.textStyle(context.captionStyle).make().p16(),
                    ]
                  ).p32(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
