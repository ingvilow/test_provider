import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_provider/models/user.dart';
import 'package:test_provider/service/user_service.dart';
import 'package:test_provider/widgets/detailed_widget/detailed_screen_wm.dart';
import 'package:test_provider/widgets/search_widget/search_model.dart';

class DetailedScreen extends ElementaryWidget<IDeatailedWidget> {
  final Users users;
  const DetailedScreen({
    required this.users,
    Key? key,
    WidgetModelFactory wmFactory = createUsersScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IDeatailedWidget wm) {
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
              return ListTile(
                title: Text(data![index].username!),
              );
            },
          );
        },
      ),
    );
  }
}
