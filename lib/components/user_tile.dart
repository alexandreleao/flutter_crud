// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, duplicate_ignore

import 'package:crud_flutter/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../routes/app_routes.dart';

class UserTile extends StatelessWidget {
  
  final User user;

  // ignore: use_key_in_widget_constructors
  const UserTile(this.user);
  
  @override
  Widget build(BuildContext context) {
      // ignore: unused_local_variable
      final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
      ? CircleAvatar(child: Icon(Icons.person))
      : CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      // ignore: sized_box_for_whitespace
      trailing: Container(
        width:100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                  );
              }, 
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(context: context,
                 builder: (ctx) => AlertDialog(
                  title: Text('Excluir Usuário'),
                  content: Text('Tem certeza???'),
                  // ignore: prefer_const_literals_to_create_immutables
                  actions:<Widget>[
                    TextButton(
                      child: Text('Não'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }, 
                      
                    ),
                    TextButton(
                      child: Text('Sim'),
                      onPressed: () {
                         Provider.of<Users>(context, listen: false).remove(user);
                         Navigator.of(context).pop();
                      }, 
                    
                    ),
                  ],
                 ),
                );
               
              }, 
            ),
          ],
        ),
      ),
    );
  }
}
