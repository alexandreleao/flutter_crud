import 'package:crud_flutter/components/user_tile.dart';
import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class UserList extends StatelessWidget{
  @override
  Widget build(BuildContext context){
     final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title:  Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
          onPressed:() {
            // ignore: prefer_const_constructors
          
          }, 
          // ignore: prefer_const_constructors
          icon:Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTile(users.byIndex(i)),
        ),
    );
  }
}

