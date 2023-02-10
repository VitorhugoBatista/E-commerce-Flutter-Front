import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<List<Product>> listProducts() async {
  var urlBR = Uri.parse('http://localhost:4000/products');
  var response1 = await http.get(urlBR);
  if (response1.statusCode == 200) {
    var data1 = jsonDecode(utf8.decode(response1.bodyBytes));
    return data1;
  } else {
    throw Exception("Erro ao carregar lista de produtos");
  }
}

class Product {
  String productId;
  String productName;
  String productPrice;
  String productDescription;
  String productMaterial;
  String productAdjective;
  String productImagepath;
  bool hasdisCount;
  String discountValue;
  double finalPrice;
  String supplier;

  Product(
      {this.productId,
      this.productName,
      this.productPrice,
      this.productDescription,
      this.productMaterial,
      this.productAdjective,
      this.productImagepath,
      this.hasdisCount,
      this.discountValue,
      this.finalPrice,
      this.supplier,
      Future<List<Product>> products});

  Product.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    productDescription = json['productDescription'];
    productMaterial = json['productMaterial'];
    productAdjective = json['productAdjective'];
    productImagepath = json['productImagepath'];
    hasdisCount = json['hasdisCount'];
    discountValue = json['discountValue'];
    finalPrice = json['finalPrice'];
    supplier = json['supplier'];
  }
  Product products = Product(products: listProducts());
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productId'] = this.productId;
    data['productName'] = this.productName;
    data['productPrice'] = this.productPrice;
    data['productDescription'] = this.productDescription;
    data['productMaterial'] = this.productMaterial;
    data['productAdjective'] = this.productAdjective;
    data['productImagepath'] = this.productImagepath;
    data['hasdisCount'] = this.hasdisCount;
    data['discountValue'] = this.discountValue;
    data['finalPrice'] = this.finalPrice;
    data['supplier'] = this.supplier;
    return data;
  }
}
