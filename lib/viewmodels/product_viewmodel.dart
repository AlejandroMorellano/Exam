import 'package:flutter/material.dart';
import 'package:examen/models/product.dart';
import 'package:examen/services/product_service.dart';

class ProductViewmodel extends  ChangeNotifier{
  final ProductService _productService = ProductService();
  List<Product> _products = <Product>[];

  List<Product> get products => _products;

  Future<void> fetchProducts() async{
    _products = await _productService.fetchProducts();
    notifyListeners();
  }
}