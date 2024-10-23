import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen/viewmodels/product_viewmodel.dart';
import 'package:examen/models/product.dart';

class ProductDetailsView extends StatefulWidget {
  final Product product;  // Asegúrate de tener una clase Product bien definida

  const ProductDetailsView({super.key, required this.product}); // Recibe el producto como parámetro

  @override
  _ProductDetailsViewState createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.product.nombre)), // Accede al producto usando widget.product
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.product.imagen), // Mostrar la imagen del producto
            SizedBox(height: 16),
            Text(
              widget.product.nombre,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              widget.product.descripcion,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Precio: \$${widget.product.precio}',
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
