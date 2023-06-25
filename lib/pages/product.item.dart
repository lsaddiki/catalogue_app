import 'package:flutter/material.dart';

import '../widgets/products.details.dart';

class ProductItem extends StatelessWidget {
  final dynamic product;
  final bool details;
  ProductItem({Key? key, required this.product, required this.details})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              color: Colors.orange,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 200,
                    width: 250,
                    child: Card(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${product['name']}",
                            ),
                            Text(
                              "MAD ${product["price"]}",
                            ),
                            if (product["promotion"] == true)
                              const Icon(
                                Icons.heart_broken,
                                color: Colors.red,
                              ),
                            Row(
                              children: [
                                for (int i = 0; i < product['stars']; i++)
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      /*Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductsDetails(
                                    productId: product['id'],
                                  )));*/
                      Navigator.pushNamed(context, "/productDetails",
                          arguments: product['id']);
                    },
                    child: Image(
                      width: 200,
                      image: AssetImage(
                        "${product['image']}",
                      ),
                    ),
                  )
                ],
              ),
            ),
            if (details == true)
              Card(
                child: Text("${product['description']}"),
              )
          ],
        ),
      ),
    );
  }
}
