
import 'package:flutter/material.dart';
import 'package:restaurant_modelo_1/services/firestore_service.dart';
import 'package:restaurant_modelo_1/widgets/modal_add_edit_category.dart';

class CategoryAdminPage extends StatefulWidget {
  @override
  State<CategoryAdminPage> createState() => _CategoryAdminPageState();
}

class _CategoryAdminPageState extends State<CategoryAdminPage> {
  FirestoreService _firestoreService =
      new FirestoreService(collection: "categories");

  showAddCategoryDialog() {
    return showDialog(
      context: context,
      builder: (BuildContextcontext) {
        return ModalAddEditCategory();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorias"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          showAddCategoryDialog();
        },
      ),
      body: FutureBuilder(
        future: _firestoreService.getCategories(),
        builder: (BuildContext context, AsyncSnapshot snap) {
          if (snap.hasData) {
            List<Map<String, dynamic>> categories = snap.data;
            return ListView.builder(
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text(categories[index]["description"]));
              },
            );
          }

          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
