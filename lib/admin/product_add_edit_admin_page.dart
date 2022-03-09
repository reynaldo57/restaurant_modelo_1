import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
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
      new FirestoreService(collection: 'products');

  FirestoreService _productFirestoreService =
  new FirestoreService(collection: 'categories');

  firebase_storage.FirebaseStorage _storage =
      firebase_storage.FirebaseStorage.instance;

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  TextEditingController _priceController = new TextEditingController();
  TextEditingController _timeController = new TextEditingController();
  TextEditingController _rateController = new TextEditingController();

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

  getImageCamera() async {
    XFile? selectImageCamera =
        await _picker.pickImage(source: ImageSource.camera);
    image = selectImageCamera;
    setState(() {});
  }

  uploadImageFirebase() async {
    firebase_storage.Reference reference = _storage.ref().child('Products');
    String time = DateTime.now().toString();
    firebase_storage.TaskSnapshot upload =
        await reference.child("$time.jpg").putFile(
              File(image!.path),
            );
    String url = await upload.ref.getDownloadURL();
    saveProduct(url);
  }

  saveProduct(String urlImage){
    Map<String, dynamic> product = {
      "category": selectCategory,
      "description": _descriptionController.text,
      "discount": null,
      "image": urlImage,
      "ingredients": ingredients,
      "name": _nameController.text,
      "price": double.parse(_priceController.text),
      "time": int.parse(_timeController.text),
      "rate": double.parse(_rateController.text),
    };

    _productFirestoreService.addFiresrtore(product);

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
          uploadImageFirebase();
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
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: "PRODUCTo",
                    hintText: "Nombre del Producto",
                  ),
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
                  controller: _descriptionController,
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
                      labelText: "Categorias",
                      hintText: "--Selecciona una categoria--"),
                  value: selectCategory,
                  onChanged: (String? value) {
                    print(value);
                  },
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
                  controller: _priceController,
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
                  controller: _timeController,
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
                  controller: _rateController,
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
                      child: TextField(
                        controller: _ingredientController,
                        decoration: InputDecoration(
                            labelText: "Ingrediente",
                            hintText: "Ingrediente del producto"),

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
                      onPressed: () {
                        getImageCamera();
                      },
                      icon: Icon(Icons.photo),
                      label: Text("Camara"),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12.0,
                ),
                image != null
                    ? Container(
                        height: 200,
                        width: double.infinity,
                        child: Image.file(
                          File(image!.path),
                          fit: BoxFit.cover,
                        ),
                      )
                    : Text(
                        "No hay Imagen",
                      ),
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
