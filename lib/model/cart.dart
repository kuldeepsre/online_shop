import 'package:equatable/equatable.dart';

import 'package:online_shop/model/product.dart';

class Cart extends Equatable {
  const Cart({this.products = const <Product>[]});

  final List<Product> products;

  int get totalPrice =>
      products.fold(0, (total, current) => total + current.price!.toInt());

  @override
  List<Object> get props => [products];
}