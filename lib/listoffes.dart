import 'dart:math';

import 'package:flutter/material.dart';

var price_generat = Random(10).nextDouble().toStringAsFixed(2);
List<Coffes> coffes = List.generate(
  names.length,
  (index) => Coffes(
      image: Image.asset(
        "assets/coffee_assets/${index + 1}.png",
        fit: BoxFit.fitHeight,
      ),
      name: names[index],
      price: "${index.toString() + price_generat}"),
);
List names = [
  "Caramel Macchiato",
  "Caramel Cold ",
  "Iced Coffe Mocha",
  "Caramelized ",
  "Toffee Nut Latte",
  "Capuchino",
  "Toffee Nut ",
  "Americano",
  "Vietnamese-Style",
  "Black Tea Latte",
  "Classic Irish ",
  "Toffee Nut Crunch "
];

class Coffes {
  dynamic image;
  dynamic name;
  dynamic price;
  Coffes({this.image, this.name, this.price});
  int selecetcoffe = 0;
}
