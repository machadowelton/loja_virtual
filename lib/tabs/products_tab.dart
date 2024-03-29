import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/tiles/categoray_tile.dart';

class ProductsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("products").getDocuments(),
        builder: (context, snanpshot) {
          if (!snanpshot.hasData)
            return Center(child: CircularProgressIndicator());
          else {
            var divideTiles = ListTile.divideTiles(
              context: context,
              tiles: snanpshot.data.documents.map((doc) {
                return CategoryTile(doc);
              }).toList(),
              color: Colors.grey[500],
            ).toList();
            return ListView(children: divideTiles);
          }
        });
  }
}
