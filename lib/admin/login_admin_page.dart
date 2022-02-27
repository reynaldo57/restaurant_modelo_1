

import 'package:flutter/material.dart';
import 'package:restaurant_modelo_1/admin/home_admin_page.dart';

class LoginAdminPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: Text("ir al home"),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeAdminPage()));
          },
        ),
      ),
    );
  }
}
