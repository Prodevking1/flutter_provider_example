import 'package:cart_provider_exemple/providers/cart_provider.dart';
import 'package:cart_provider_exemple/screens/view_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart_model.dart';

class Catalog extends StatefulWidget {
  Catalog({Key? key}) : super(key: key);

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  List<Item> catalogItems = [
    Item(0, 'Phone', 1),
    Item(1, 'Tablet', 1),
    Item(2, 'Watch', 1),
    Item(3, 'Mac', 1),
    Item(4, 'Charger', 1),
    Item(5, 'Mouse', 1),
    Item(6, 'Keyboard', 1),
    Item(7, 'Screen', 1),
    Item(8, 'Monitor', 1),
    Item(9, 'Desk', 1),
    Item(10, 'Trackpad', 1),
  ];
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20.0, left: 20.0),
        child: Column(
          children: <Widget>[
            Text(
              "Welcome to our store",
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.77,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 70.0),
                itemCount: catalogItems.length,
                itemBuilder: ((BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            catalogItems[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  cartProvider.decreaseQuantity(index);
                                },
                                child: Icon(
                                  Icons.remove_circle,
                                  size: 35.0,
                                  color: Colors.red,
                                ),
                              ),
                              SizedBox(
                                  height: 20.0,
                                  width: 20.0,
                                  child: Center(
                                    child: Text(
                                      !cartProvider.items
                                              .contains(catalogItems[index])
                                          ? '0'
                                          : '${cartProvider.getQuantity(index)}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    ),
                                  )),
                              GestureDetector(
                                onTap: () {
                                  if ((cartProvider.items
                                      .contains(catalogItems[index]))) {
                                    cartProvider.increaseQuantity(index);
                                  } else {
                                    cartProvider.addItem(
                                        index, catalogItems[index]);
                                  }
                                },
                                child: Icon(
                                  Icons.add_circle,
                                  size: 35.0,
                                  color: Colors.blue,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                }),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => CartScreen(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    'View Cart',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
