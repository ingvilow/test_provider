import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_provider/models/user.dart';
import 'package:test_provider/service/user_service.dart';

class SearchModel extends ElementaryModel {
  final ValueNotifier<List<Users>?> searchUsers = ValueNotifier([]);

  final ApiService _searchService;

  SearchModel(this._searchService);

  Future<List<Users>?> getUsersByName(int id) async {
    return _searchService
        .fetchHero()
        .then((value) => value.where((element) => element.id == id).toList());
  }
}
