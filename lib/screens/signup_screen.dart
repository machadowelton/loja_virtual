import 'package:flutter/material.dart';
import 'package:loja_virtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final __nameController = TextEditingController();
  final __emailController = TextEditingController();
  final __passController = TextEditingController();
  final __addressController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Criar conta"),
          centerTitle: true,
        ),
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoadging)
              return Center(
                child: CircularProgressIndicator(),
              );
            return Form(
              key: _formkey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  TextFormField(
                    controller: __nameController,
                    decoration: InputDecoration(hintText: "Nome completo"),
                    validator: (text) {
                      if (text.isEmpty) return "Nome invalido";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: __emailController,
                    decoration: InputDecoration(hintText: "E-mail"),
                    keyboardType: TextInputType.emailAddress,
                    validator: (text) {
                      if (text.isEmpty || !text.contains("@"))
                        return "E-mail invalido";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: __passController,
                    decoration: InputDecoration(hintText: "Senha"),
                    obscureText: true,
                    validator: (text) {
                      if (text.isEmpty || text.length < 6)
                        return "Senha invalida";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                    controller: __addressController,
                    decoration: InputDecoration(hintText: "Endereço"),
                    validator: (text) {
                      if (text.isEmpty) return "Endereço invalido";
                    },
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  SizedBox(
                    height: 44.0,
                    child: RaisedButton(
                      child: Text(
                        "Criar conta",
                        style: TextStyle(fontSize: 18.0),
                      ),
                      textColor: Colors.white,
                      color: Theme.of(context).primaryColor,
                      onPressed: () {
                        if (_formkey.currentState.validate()) {
                          Map<String, dynamic> userData = {
                            "name": __nameController.text,
                            "email": __emailController.text,
                            "address": __addressController.text
                          };
                          model.signUp(
                              userData: userData,
                              pass: __passController.text,
                              onSuccess: _onSuccess,
                              onFailure: _onFailure);
                        }
                      },
                    ),
                  )
                ],
              ),
            );
          },
        ));
  }

  void _onSuccess() {
  }
  void _onFailure() {
  }
}
