import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class UserForm extends StatelessWidget {

  final _form = GlobalKey<FormState>();
  final Map <String, String> _formData = {};

  void _loadFormData(User user) { 
     if(user != null){
      _formData['id'] = user.id;
      _formData['name'] = user.name;
      _formData['email'] = user.email;
      _formData['avatarUrl'] = user.avatarUrl;
     }
      
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final user = ModalRoute.of(context)!.settings.arguments as User;
    // ignore: avoid_print
    _loadFormData(user);
    
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
                initialValue: _formData['name'],
                // ignore: prefer_const_constructors
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
                initialValue: _formData['email'],
                // ignore: prefer_const_constructors
                decoration: InputDecoration(labelText: 'E-mail'), 
                  onSaved: (value) => _formData['email'] = value!,
              ),
               TextFormField(
                initialValue: _formData['avatarUrl'],
                // ignore: prefer_const_constructors
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