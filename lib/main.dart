import 'package:flutter/material.dart';
import 'package:flutter_cards/product_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Product Page',
      home: ProductCard(),
    );
  }
}
