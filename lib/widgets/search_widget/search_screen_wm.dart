import 'package:elementary/elementary.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_provider/models/user.dart';
import 'package:test_provider/service/user_service.dart';
import 'package:test_provider/widgets/search_widget/search_delegate.dart';
import 'package:test_provider/widgets/search_widget/search_model.dart';
import 'package:test_provider/widgets/search_widget/search_screen.dart';

class SearchUserWM extends WidgetModel<SearchScreen, SearchModel>
    implements ISearchWidget {
  SearchUserWM(SearchModel model) : super(model);
  final EntityStateNotifier<List<Users>?> _currentUsers =
      EntityStateNotifier(null);

  @override
  ListenableState<EntityState<List<Users>?>> get usersList => _currentUsers;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      _currentUsers.loading();
      final users = await model.getUsersByName();
      _currentUsers.content(users);
    } on Exception catch (err) {
      _currentUsers.error(err);
    }
  }
}

abstract class ISearchWidget extends IWidgetModel {
  ListenableState<EntityState<List<Users>?>> get usersList;
}

SearchUserWM createUsersScreenWM(BuildContext _) => SearchUserWM(
      SearchModel(
        ApiService(),
      ),
    );
