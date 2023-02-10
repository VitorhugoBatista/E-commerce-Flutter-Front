import 'dart:ui';

import 'package:flutter/material.dart'
    show
        Border,
        BorderRadius,
        BoxDecoration,
        BuildContext,
        Colors,
        Container,
        EdgeInsets,
        Expanded,
        FontWeight,
        IconButton,
        Key,
        Padding,
        RoundedRectangleBorder,
        Row,
        SizedBox,
        StatelessWidget,
        Text,
        TextStyle,
        Widget,
        required;
import 'package:flutter_svg/flutter_svg.dart' show SvgPicture;
import '../../../models/Product.dart' show Product;
import '../../../constants.dart' show kDefaultPaddin;

class AddToCart extends StatelessWidget {
  const AddToCart({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: kDefaultPaddin),
            height: 50,
            width: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                  //color: product.color,
                  ),
            ),
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/add_to_cart.svg",
                //color: product.color,
              ),
              onPressed: () {
                AddToCart(product: this.product);
              },
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 50,
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                //color: product.color,
                onPressed: () {},
                child: Text(
                  "Buy  Now".toUpperCase(),
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  FlatButton(
      {RoundedRectangleBorder shape,
      Color color,
      Null Function() onPressed,
      Text child}) {}
}
