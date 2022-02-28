


import 'package:flutter/material.dart';

class ProductAddEditAdminPage extends StatefulWidget {
  const ProductAddEditAdminPage({Key? key}) : super(key: key);

  @override
  _ProductAddEditAdminPageState createState() => _ProductAddEditAdminPageState();
}

class _ProductAddEditAdminPageState extends State<ProductAddEditAdminPage> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agregar Product"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if(_formKey.currentState!.validate()){

          }
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
                    labelText: "PRODUCTo",
                    hintText: "Nombre del Producto"
                  ),
                  validator: (String? value){
                    if(value == null || value.isEmpty){
                      return "Completar el ampo";
                    };
                    return null;
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
