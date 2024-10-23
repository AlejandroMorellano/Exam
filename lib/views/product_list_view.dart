import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:examen/viewmodels/product_viewmodel.dart';
import 'package:examen/views/product_view.dart';

class ProductListView extends StatefulWidget{
  const ProductListView({super.key});

  @override
  _ProdcutViewState createState () => _ProdcutViewState();
}

  class _ProdcutViewState extends State<ProductListView> {
  @override
  void initState() {
    super.initState();
    Provider.of<ProductViewmodel>
    (context, listen:false).fetchProducts();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("LISTA DE PRODUCTOS"),),
      body: FutureBuilder(
        future: Provider.of<ProductViewmodel>(context, listen: false).fetchProducts(), 
         builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Consumer<ProductViewmodel>(
              builder: (context, viewModel, child){
                return ListView.builder(
                  itemCount: viewModel.products.length,
                  itemBuilder: (context, index){
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(viewModel.products[index].imagen),
                        ),
                        title: Text("${viewModel.products[index].nombre} ${viewModel.products[index].categoria}"),
                        subtitle: Text(viewModel.products[index].precio.toString()),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailsView(product: viewModel.products[index]), // Pasar el producto seleccionado
                            ),
                          );
                        },
                      ),
                    );
                  }
                );
              }
            );
          }
        }
      ),
    );
  }
}
