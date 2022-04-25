import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/provider/counter_provider.dart';



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
        title: const Text('Third Page'),
      ),
      body: Column(
        children: [
          Text(
         provider.counter.toString(),
          ),
          ElevatedButton(
            onPressed: (){
             context.watch<CounterProvider>().incrementCounter();
            },
            child: const Text('Increase'),
          ),
        ],
      ),
    );
  }
}
