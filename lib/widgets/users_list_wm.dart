import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider/models/user.dart';
import 'package:test_provider/service/user_service.dart';
import 'package:test_provider/widgets/detailed_widget/detailed_screen.dart';
import 'package:test_provider/widgets/search_widget/search_delegate.dart';
import 'package:test_provider/widgets/users_list_models.dart';
import 'package:test_provider/widgets/users_list_screen.dart';

class UsersListWM extends WidgetModel<UsersListScreen, UsersListModel>
    implements IUsersWM {
  final EntityStateNotifier<List<Users>?> _currentUsers =
      EntityStateNotifier(null);

  UsersListWM(
    UsersListModel model,
  ) : super(model);

  @override
  ListenableState<EntityState<List<Users>?>> get usersList => _currentUsers;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadUsers();
  }

  //инициализирует открытие поиска в верхнем баре
  @override
  Future<void> showSearchScreen() async {
    await showSearch<void>(
      context: context,
      delegate: SearchDelegateScreen(),
      query: '',
    );
  }

  Future<void> _loadUsers() async {
    try {
      _currentUsers.loading();
      final users = await model.getUser();
      _currentUsers.content(users);
    } on Exception catch (err) {
      _currentUsers.error(err);
    }
  }

  //переход на другую страницу для детальной информации
  @override
  void onTapById(Users users) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (_) => DetailedScreen(
        users: users,
      ),
    ));
  }
}

UsersListWM createUsersScreenWM(BuildContext _) => UsersListWM(
      UsersListModel(
        ApiService(),
      ),
    );

abstract class IUsersWM extends IWidgetModel {
  ListenableState<EntityState<List<Users>?>> get usersList;

  void showSearchScreen();

  void onTapById(Users users);
}
