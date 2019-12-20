import 'package:cloud_firestore/cloud_firestore.dart';

class ProductData {

  ProductData.fromDocument(DocumentSnapshot snapshot) {
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"] + 0.0;
    images = snapshot.data["images"];
    sizes =  snapshot.data["sizes"];
  }
  
  Map<String, dynamic> toResumeMap() {
    return {
      "title": title,
      "description": description,
      "price": price
    };
  }

  String category;

  String id;

  String title;
  String description;

  double price;

  List images;
  List sizes;

  @override
  String toString() {    
    return "Product Data[id: $id, category: $category, title: $title, description: $description, price: $price]";
  }

}