import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'constants/constants.dart';
import 'types/types.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen> {
  final List<Product> _products = [];
  final List<Product> _cartItems = [];

  @override
  void initState() {
    super.initState();
    Uri uri = Uri.parse("$baseUrl/$product");
    get(uri).then((response) {
      List<dynamic> responseBody = jsonDecode(response.body) as List;
      List<Product> products = responseBody
          .map((e) => Product.fromJson(e))
          .toList();

      setState(() {
        _products.addAll(products);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade50,
      appBar: buildAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Search Bar Here"),
            CarouselSlider(
              items: _products.map((item) => buildCarouselCard(item)).toList(),
              options: CarouselOptions(
                height: 500.0,
                autoPlay: false,
                enlargeCenterPage: true,
                enlargeFactor: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.orange.shade50,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Color(0xffc8b893)),
      title: Center(
        child: Text(
          "ShopEazy Store",
          style: TextStyle(
            color: Color(0xffc8b893),
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
      ),
      actions: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.shopping_bag_rounded, size: 28.0),
            ),
            Positioned(
              top: 10.0,
              right: 10.0,
              child: Container(
                width: 15.0,
                height: 15.0,
                decoration: BoxDecoration(
                  color: Colors.red.shade600,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _cartItems.length.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 8.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildCarouselCard(Product prod) {
    return Container(
      padding: EdgeInsets.all(6.0),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12.0)),
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.star, color: Colors.amber.shade500, size: 16.0),
                    SizedBox(width: 4.0),
                    Text(
                      '${prod.rating.rate} out of 5 in ${prod.rating.count} reviews',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Image.network(prod.image, height: 200.0),
              Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    prod.title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    prod.description,
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 14.0,
                      fontWeight: FontWeight.normal,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '\$ ${prod.price.toString()}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart_rounded,
                      size: 28.0,
                      color: Colors.amber.shade400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
