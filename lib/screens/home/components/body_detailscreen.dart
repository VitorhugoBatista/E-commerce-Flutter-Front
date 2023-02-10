import 'dart:convert';
import 'package:badges/badges.dart' as badges;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Product.dart';
import 'package:shop_app/screens/details/details_screen.dart';
import 'package:http/http.dart' as http;
import 'categorries.dart';
import 'item_card.dart';

class Bodydetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
          child: Text(
            "Todos produtos",
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        Categories(),
        Expanded(
          child: FutureBuilder<List>(
              future: listProducts(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var products = snapshot.data;
                  //print(Product(productAdjective: String.fromCharCode(3)));
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
                    child: GridView.builder(
                        itemCount: snapshot.data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: kDefaultPaddin,
                          crossAxisSpacing: kDefaultPaddin,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                  child: Container(
                                      padding: EdgeInsets.all(kDefaultPaddin),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Hero(
                                        tag: snapshot.data[index]['productId'],
                                        child: Image.network(snapshot
                                            .data[index]['productImagepath']),
                                      ))),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: kDefaultPaddin / 4),
                                child: GestureDetector(
                                  onTap: () {
                                    return Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Scaffold(
                                            backgroundColor: Color.fromARGB(
                                                255, 255, 255, 255),
                                            appBar: AppBar(
                                              elevation: 0,
                                              backgroundColor: Colors.white,
                                              leading: IconButton(
                                                icon: SvgPicture.asset(
                                                  'assets/icons/back.svg',
                                                  color: Colors.black,
                                                ),
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                              ),
                                              actions: <Widget>[
                                                IconButton(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  icon: SvgPicture.asset(
                                                    'assets/icons/search.svg',
                                                    color: Colors.black,
                                                  ),
                                                  onPressed: () {},
                                                ),
                                                IconButton(
                                                  color: Colors.black,
                                                  icon: SvgPicture.asset(
                                                    "assets/icons/cart.svg",
                                                    color: Colors.black,
                                                  ),
                                                  splashColor: Color.fromARGB(
                                                      255, 5, 5, 5),
                                                  onPressed: () {},
                                                ),
                                                SizedBox(
                                                    width: kDefaultPaddin / 2)
                                              ],
                                            ),
                                            body: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                    child:
                                                        SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16,
                                                                    16, 16, 16),
                                                        child: Hero(
                                                            tag: 'mainimage',
                                                            transitionOnUserGestures:
                                                                true,
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              child:
                                                                  Image.network(
                                                                snapshot.data[
                                                                        index][
                                                                    'productImagepath'],
                                                                width: double
                                                                    .infinity,
                                                                height: 300,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            )),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 0,
                                                                    16, 0),
                                                        child: Text(
                                                            'Detalhes do Produto',
                                                            style: TextStyle(
                                                                color:
                                                                    kTextLightColor)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 4,
                                                                    0, 0),
                                                        child: Text(
                                                            '\$${snapshot.data[index]['productPrice']}',
                                                            textAlign:
                                                                TextAlign.start,
                                                            style: TextStyle(
                                                                color:
                                                                    kTextLightColor)),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(16, 8,
                                                                    16, 8),
                                                        child: Text(
                                                          snapshot.data[index][
                                                              'productDescription'],
                                                          style: TextStyle(
                                                              color:
                                                                  kTextLightColor),
                                                        ),
                                                      ),
                                                      Material(
                                                        color:
                                                            Colors.transparent,
                                                        elevation: 3,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(0),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          height: 100,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Color(
                                                                      0xFFF1F4F8),
                                                                  boxShadow: [
                                                                    BoxShadow(
                                                                      blurRadius:
                                                                          4,
                                                                      color: Color(
                                                                          0x320F1113),
                                                                      offset:
                                                                          Offset(
                                                                              0,
                                                                              -2),
                                                                    )
                                                                  ],
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16,
                                                                        0,
                                                                        16,
                                                                        34),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                    width: 130,
                                                                    height: 50,
                                                                    decoration: BoxDecoration(
                                                                        color: const Color(0xFFFFFFFF),
                                                                        borderRadius: BorderRadius.circular(12),
                                                                        shape: BoxShape.rectangle,
                                                                        border: Border.all(
                                                                          color:
                                                                              const Color(0xFFF1F4F8),
                                                                          width:
                                                                              2,
                                                                        )))
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ))
                                              ],
                                            ),
                                          ),
                                        ));
                                  },
                                  child: Text(
                                    snapshot.data[index]['productName'],
                                    style: TextStyle(color: kTextLightColor),
                                  ),
                                ),
                              ),
                              Text(
                                "\$${snapshot.data[index]['productPrice']}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )
                            ],
                          );
                        }),
                  );
                }

                return Center(child: CircularProgressIndicator());
              }),
        )
      ],
    );
  }

  FlatButton(
      {RoundedRectangleBorder shape, Null Function() onPressed, Text child}) {}
}

Future<List> listProducts() async {
  var urlBR = Uri.parse('http://10.0.2.2:4000/products');
  var response1 = await http.get(urlBR);
  if (response1.statusCode == 200) {
    var data = jsonDecode(utf8.decode(response1.bodyBytes));
    return data;
  } else {
    throw Exception("Erro ao carregar lista de produtos");
  }
}
