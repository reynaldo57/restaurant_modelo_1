import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
  TextEditingController _ingredientController = new TextEditingController();

  List<Map<String, dynamic>> categories = [];
  List<String> ingredients = [];
  String selectCategory = "";
  ImagePicker _picker = new ImagePicker();
  XFile? image;

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

  getImageGallery() async {
    XFile? selectImageGallery =
        await _picker.pickImage(source: ImageSource.gallery);
    image = selectImageGallery;
    setState(() {});
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
                  style: TextStyle(color: Colors.black87),
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
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _ingredientController,
                        decoration: InputDecoration(
                            labelText: "Ingrediente",
                            hintText: "Ingrediente del producto"),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Completar el ampo";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    MaterialButton(
                      onPressed: () {
                        ingredients.add(_ingredientController.text);
                        _ingredientController.clear();
                        setState(() {});
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      color: Colors.deepPurpleAccent,
                    ),
                  ],
                ),
                SizedBox(
                  width: 70.0,
                ),
                SizedBox(
                  height: 260,
                  child: ingredients.length > 0
                      ? ListView.builder(
                          primary: true,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemCount: ingredients.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Text(ingredients[index]),
                              trailing: IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {
                                  ingredients.removeAt(index);
                                  setState(() {});
                                },
                              ),
                            );
                          })
                      : Center(
                          child: Text("no hay ingredientes"),
                        ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Imagen del Producto"),
                    ElevatedButton.icon(
                      onPressed: () {
                        getImageGallery();
                      },
                      icon: Icon(Icons.photo),
                      label: Text("Galeria"),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.photo),
                      label: Text("Camara"),
                    ),
                  ],
                ),
                image != null ? Image.file(File(image!.path)) : Text("No hay Imagen",),
                SizedBox(
                  height: 70.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
