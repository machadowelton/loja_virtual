import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loja_virtual/datas/product_data.dart';

class CartProduct {

  CartProduct();

  CartProduct.fromDocument(DocumentSnapshot documentSnapshot) {
    id = documentSnapshot.documentID;
    catetory = documentSnapshot.data["category"];
    product_id = documentSnapshot.data["product_id"];
    quantity = documentSnapshot.data["quantity"];
    size = documentSnapshot.data["size"];
  }

  Map<String, dynamic> toMap() {
    return {
      "category": catetory,
      "product_id": product_id,
      "quantity": quantity,
      "size": size,
      //"procuct": productData.toResumeMap()
    };
  }

  String id;

  String catetory;
  String product_id;

  int quantity;
  String size;

  ProductData productData;

  @override
  String toString() {    
    return "Cart Product[id: $id, category: $catetory, product_id: $product_id, quantity: $quantity, size: $size, product data: $productData]";
  }
}