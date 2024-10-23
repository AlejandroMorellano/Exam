import 'package:flutter/material.dart';
import 'package:examen/viewmodels/product_viewmodel.dart';
import 'package:examen/views/product_list_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProductViewmodel(),
      child: MaterialApp(
        home: ProductListView(),
      ),
    );
  }
}
