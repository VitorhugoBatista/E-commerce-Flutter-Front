import 'dart:convert';
import 'package:shop_app/screens/home/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:http/http.dart' as http;
import 'add_to_cart.dart';
import 'description.dart';
import 'product_title_with_image.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // It provide us total height and width
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: kDefaultPaddin,
                    right: kDefaultPaddin,
                  ),
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(product: product),
                      SizedBox(height: kDefaultPaddin / 2),
                      SizedBox(height: kDefaultPaddin / 2),
                      AddToCart(product: product)
                    ],
                  ),
                ),
                //ProductTitleWithImage(products: ima,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

Future<List> listProducts() async {
  var urlBR = Uri.parse('http://localhost:4000/products');
  var response1 = await http.get(urlBR);
  if (response1.statusCode == 200) {
    var data1 = jsonDecode(utf8.decode(response1.bodyBytes));
    return data1;
  } else {
    throw Exception("Erro ao carregar lista de produtos");
  }
}
