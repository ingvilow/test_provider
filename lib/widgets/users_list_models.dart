import 'package:elementary/elementary.dart';

import '../models/user.dart';
import '../service/user_service.dart';

class UsersListModel extends ElementaryModel {
  final ApiService? _apiService;

  UsersListModel(this._apiService);

  Future<List<Users>?> getUser() async {
    return _apiService?.fetchHero();
  }
}
