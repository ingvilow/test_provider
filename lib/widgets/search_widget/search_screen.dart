import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:test_provider/models/user.dart';
import 'package:test_provider/widgets/users_list_wm.dart';

class SearchScreen extends ElementaryWidget<IUsersWM> {
  const SearchScreen({
    Key? key,
    WidgetModelFactory wmFactory = createUsersScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IUsersWM wm) {
    return Scaffold(
      appBar: AppBar(),
      body: EntityStateNotifierBuilder<List<Users>?>(
        listenableEntityState: wm.usersList,
        errorBuilder: (_, __, ___) {
          return const Text('No result');
        },
        loadingBuilder: (_, __) {
          return const CircularProgressIndicator();
        },
        builder: (_, data) {
          return ListView.builder(
            itemCount: data?.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(data![index].name!));
            },
          );
        },
      ),
    );
  }
}
