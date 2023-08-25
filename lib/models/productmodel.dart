// ignore: ProductDetails
// ignore_for_file: file_names
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String category;
  String id;
  String title;
  String description;
  double price;
  List images = [];
  List sizes = [];

  ProductModel({
    required this.category,
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.sizes,
  });

  static ProductModel fromDocumentSnapshot(DocumentSnapshot snapshot) {
    Map<String, dynamic> dataMap = snapshot.data() as Map<String, dynamic>;
    String category = dataMap['category'];
    String id = dataMap['id'];
    String title = dataMap['title'];
    String description = dataMap['description'];
    double price = dataMap['price'];
    List images = [dataMap['images']];
    List sizes = [dataMap['sizes']];

    return ProductModel(
        category: category,
        id: id,
        title: title,
        description: description,
        price: price,
        images: images,
        sizes: sizes);
  }
}
