import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider/models/user.dart';
import 'package:test_provider/service/user_service.dart';
import 'package:test_provider/widgets/detailed_widget/detailed_model.dart';
import 'package:test_provider/widgets/detailed_widget/detailed_screen.dart';
import 'package:test_provider/widgets/search_widget/search_model.dart';

class DetailedScreenWM extends WidgetModel<DetailedScreen, DetailedModel>
    implements IDeatailedWidget {
  DetailedScreenWM(DetailedModel model) : super(model);
  final EntityStateNotifier<List<Users>?> _currentUsers =
      EntityStateNotifier(null);

  @override
  ListenableState<EntityState<List<Users>?>> get usersList => _currentUsers;

  @override
  @override
  void initWidgetModel() {
    super.initWidgetModel();
    _loadUsers();
  }

  Future<void> _loadUsers() async {
    try {
      _currentUsers.loading();
      final users = await model.getDetailedUsers();
      _currentUsers.content(users);
    } on Exception catch (err) {
      _currentUsers.error(err);
    }
  }
}

abstract class IDeatailedWidget extends IWidgetModel {
  ListenableState<EntityState<List<Users>?>> get usersList;
}

DetailedScreenWM createUsersScreenWM(BuildContext _) => DetailedScreenWM(
      DetailedModel(
        ApiService(),
      ),
    );
