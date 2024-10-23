class Product {
  final int id;
  final String nombre;
  final String descripcion;
  final double precio;
  final String imagen;
  final String categoria;

  Product({
      required this.id,
      required this.nombre,
      required this.descripcion,
      required this.precio,
      required this.imagen,
      required this.categoria
  });

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      id: json['id'], 
      nombre: json['nombre'], 
      descripcion: json['descripcion'], 
      precio: json['precio'], 
      imagen: json['imagen'], 
      categoria: json['categoria']
    );
  }
}