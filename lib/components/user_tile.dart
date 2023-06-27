// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, duplicate_ignore

import 'package:flutter/material.dart';
import '../models/user.dart';

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
      trailing: Container(
        width:100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.orange,
              onPressed: () {}, 
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {}, 
            ),
          ],
        ),
      ),
    );
  }
}

