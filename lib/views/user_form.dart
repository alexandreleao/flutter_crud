import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class UserForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map <String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
     return Scaffold(
        appBar: AppBar(
          // ignore: prefer_const_constructors
          title: Text('Formulário de Usuário'),
          actions: <Widget> [
            IconButton(
              onPressed: () {
              final isValid = _form.currentState!.validate();

              if(isValid){
                 _form.currentState!.save();

                 Provider.of<Users>(context, listen: false).put(User(
                   id: _formData['id'].toString(),
                   name: _formData['name'].toString(),
                   email: _formData['email'].toString(),
                   avatarUrl: _formData['avatarUrl'].toString(),
                 ));
                 Navigator.of(context).pop();
              }
               
              }, 
              // ignore: prefer_const_constructors
              icon: Icon(Icons.save),
            )
          ],
        ),
        // ignore: prefer_const_constructors
        body: Padding(padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome'),
                validator: (value){
                  if(value == null || value.trim().isEmpty){
                    return 'Informe o seu nome!';
                  }

                  if(value.trim().length < 3){
                    return 'Nome muito pequeno. No mínimo três letras!';
                  }

                  return null;
                  
                },
                onSaved: (value) => _formData['name'] = value!,
              ),
               TextFormField(
                decoration: InputDecoration(labelText: 'E-mail'), 
                  onSaved: (value) => _formData['email'] = value!,
              ),
               TextFormField(
                decoration: InputDecoration(labelText: 'URL do Avatar'),
                  onSaved: (value) => _formData['avatarUrl'] = value!,
              ),
            ],
          ),
        ),
        ),
     );
  }
}