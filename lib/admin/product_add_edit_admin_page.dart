import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_modelo_1/services/firestore_service.dart';

class ProductAddEditAdminPage extends StatefulWidget {
  const ProductAddEditAdminPage({Key? key}) : super(key: key);

  @override
  _ProductAddEditAdminPageState createState() =>
      _ProductAddEditAdminPageState();
}

class _ProductAddEditAdminPageState extends State<ProductAddEditAdminPage> {
  final _formKey = GlobalKey<FormState>();
  FirestoreService _categoryFirestoreService =
      new FirestoreService(collection: 'categories');
  List<Map<String, dynamic>> categories = [];
  String selectCategory = "";

  @override
  initState() {
    super.initState();
    getDataCategory();
  }

  getDataCategory() {
    _categoryFirestoreService.getCategories().then((value) {
      categories = value;
      selectCategory = categories[0]["id"];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Product"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {}
        },
        child: Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "PRODUCTo", hintText: "Nombre del Producto"),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Completar el ampo";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: "Description",
                      hintText: "DESCRIPTION del Producto"),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Completar el ampo";
                    }
                    return null;
                  },
                ),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                      labelText: "Categoria",
                      hintText: "--Selecciona una categoria--"),
                  value: selectCategory,
                  onChanged: (String? value) {},
                  items: categories
                      .map(
                        (e) => DropdownMenuItem<String>(
                          child: Text(e["description"]),
                          value: e["id"],
                        ),
                      )
                      .toList(),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "pRECIO", hintText: "Precio del Producto"),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Completar el ampo";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Tiempo", hintText: "Tiempo de preparacion"),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Completar el ampo";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Puntaje", hintText: "Puntaje del producto"),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Completar el ampo";
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
