//я так подозреваю, что именно тут должна просиходить, наверное, такая штука как фильтрация по айди, например?
import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_provider/widgets/users_list_models.dart';
import 'package:test_provider/widgets/users_list_screen.dart';

import '../models/user.dart';
import '../service/user_service.dart';

class UsersListWM extends WidgetModel<UsersListScreen, UsersListModel>
    implements IUsersWM {
  final EntityStateNotifier<List<Users>?> _currentUsers =
      EntityStateNotifier(null);

  UsersListWM(UsersListModel model) : super(model);

  @override
  ListenableState<EntityState<List<Users>?>> get usersList => _currentUsers;

  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadUsers();
  }

  // эта функция и загружает мне всех пользователей.
  // До этого я думала, что достаточно того, что здесь UsersListModel
  //не работало сначала из-за этого
  Future<void> _loadUsers() async {
    try {
      _currentUsers.loading();
      final users = await model.getUser();
      _currentUsers.content(users);
    } on Exception catch (err) {
      _currentUsers.error(err);
    }
  }
}

UsersListWM createUsersScreenWM(BuildContext _) => UsersListWM(
      UsersListModel(
        ApiService(),
      ),
    );

abstract class IUsersWM extends IWidgetModel {
  ListenableState<EntityState<List<Users>?>> get usersList;
}
