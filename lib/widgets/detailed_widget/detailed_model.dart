import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_provider/models/user.dart';
import 'package:test_provider/service/user_service.dart';

class DetailedModel extends ElementaryModel {
  final ValueNotifier<List<Users>?> searchUsers = ValueNotifier([]);

  final ApiService _searchService;

  DetailedModel(this._searchService);

  Future<List<Users>> getDetailedUsers() async {
    return _searchService
        .fetchHero()
        .then((value) => searchUsers.value = value);
  }
}
