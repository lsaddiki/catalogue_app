import 'dart:convert';

import 'package:catalog_app/pages/product.item.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsDetails extends StatefulWidget {
  final int productId;
  const ProductsDetails({Key? key, required this.productId}) : super(key: key);

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  dynamic product = null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    http
        .get(Uri.parse(
            "http://192.168.43.117:9000/products/${widget.productId}"))
        .then((resp) {
      setState(() {
        product = json.decode(resp.body);
      });
    }).catchError((err) {
      print("******** Error ********");
      print(err);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Poducts Details=> ${widget.productId}"),
      ),
      body: Center(
          child: (product != null)
              ? ProductItem(
                  product: product,
                  details: true,
                )
              : Container()),
    );
  }
}
