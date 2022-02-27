
import 'package:flutter/material.dart';
import 'package:restaurant_modelo_1/services/firestore_service.dart';

class CategoryAdminPage extends StatelessWidget {

  FirestoreService _firestoreService = new FirestoreService(collection: "categories");
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
      ),
      body: FutureBuilder(
        future: _firestoreService.getCategories(),
        builder: (BuildContext context, AsyncSnapshot snap){
          if(snap.hasData){
            List<Map<String, dynamic>> categories = snap.data;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index){
                return ListTile(
                  title: Text(categories[index]["description"])
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
