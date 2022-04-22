import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Third Page'),
        ),
        body: Column(
          children: [
            Text(
                context.watch()
            ),
            ElevatedButton(onPressed: (){
            }, child: Text('Increase'))
          ],
        ));
  }
}
