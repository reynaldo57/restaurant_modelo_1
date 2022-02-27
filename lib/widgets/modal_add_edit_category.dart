

import 'package:flutter/material.dart';
import 'package:restaurant_modelo_1/services/firestore_service.dart';



class ModalAddEditCategory extends StatefulWidget {
  const ModalAddEditCategory({Key? key}) : super(key: key);

  @override
  _ModalAddEditCategoryState createState() => _ModalAddEditCategoryState();
}

class _ModalAddEditCategoryState extends State<ModalAddEditCategory> {

  FirestoreService _firestoreService = new FirestoreService(collection: "categories");

  bool _order = false;
  TextEditingController _categoryController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Agregar categoria"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _categoryController,
              decoration: InputDecoration(hintText: "categoria"),
              validator: (String? value){
                if(value == null || value.isEmpty){
                  return "Campo categoria Obligatorio";
                };
                return null;
              },
            ),
            Row(
              children: [
                Text("Orden"),
                Checkbox(
                  value: _order,
                  onChanged: (bool? value) {
                    _order = value!;
                    setState((){

                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancelar"),
        ),
        TextButton(
          onPressed: () {
            if(_formKey.currentState!.validate()){
              _firestoreService.addFiresrtore({
                "description": _categoryController.text,
                "order": _order,
              });
            }
            if(_formKey.currentState!.validate()){

            }
          },
          child: Text("Agregar"),
        ),
      ],
    );
  }
}
