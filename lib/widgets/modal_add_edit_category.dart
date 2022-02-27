

import 'package:flutter/material.dart';



class ModalAddEditCategory extends StatefulWidget {
  const ModalAddEditCategory({Key? key}) : super(key: key);

  @override
  _ModalAddEditCategoryState createState() => _ModalAddEditCategoryState();
}

class _ModalAddEditCategoryState extends State<ModalAddEditCategory> {

  bool _order = false;


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Agregar categoria"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            decoration: InputDecoration(hintText: "Categoria"),
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
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Cancelar"),
        ),
        TextButton(
          onPressed: () {},
          child: Text("Agregar"),
        ),
      ],
    );
  }
}
