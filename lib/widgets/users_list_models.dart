import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';

import 'package:test_provider/models/user.dart';

import 'package:test_provider/service/user_service.dart';

class UsersListModel extends ElementaryModel {
  final ValueNotifier<List<Users>?> searchUsers = ValueNotifier([]);
  final ApiService _apiService;

  UsersListModel(
    this._apiService,
  );

  Future<List<Users>?> getUser() async {
    return _apiService.fetchHero();
  }
}
