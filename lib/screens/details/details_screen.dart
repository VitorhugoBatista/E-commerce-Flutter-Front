import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/components/body.dart';
import 'package:http/http.dart' as http;

class DetailsScreen extends StatelessWidget {
  final Product products;

  const DetailsScreen({Key key, this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // each product have a color
      // backgroundColor: product.color,
      appBar: buildAppBar(context),
      body: Body(product: products),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      // backgroundColor: product.color,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset("assets/icons/search.svg"),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset("assets/icons/cart.svg"),
          onPressed: () {
            print(products.finalPrice);
          },
        ),
        SizedBox(width: kDefaultPaddin / 2)
      ],
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
