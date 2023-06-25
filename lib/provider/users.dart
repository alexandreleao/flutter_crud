import 'package:crud_flutter/data/dummy_users.dart';
import 'package:crud_flutter/models/user.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  final Map <String, User> _items = {...DUMMY_USERS };

  List<User> get all {
    return [..._items.values];
  }

  int get count {
    return _items.length;
  }

  User byIndex(int i) {
    return _items.values.elementAt(i);
  }
}