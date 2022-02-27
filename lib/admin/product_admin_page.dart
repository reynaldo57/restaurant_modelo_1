

import 'package:flutter/material.dart';
import 'package:restaurant_modelo_1/services/firestore_service.dart';

class ProductAdminPage extends StatelessWidget {

  FirestoreService _firestoreService = new FirestoreService(collection: 'products');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("product"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: _firestoreService.getAllProducts(),
        builder: (BuildContext context, AsyncSnapshot snap){
          if (snap.hasData){
            List<Map<String, dynamic>> products = snap.data;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: ListTile(
                    title: Text(products[index]["name"]),
                    subtitle: Text(
                      products[index]["description"],
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.delete)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.edit))
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}
