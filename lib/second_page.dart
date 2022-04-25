import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/provider/counter_provider.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CounterProvider>(
      create: (context) {
        return CounterProvider();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Second Page'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Provider.of<CounterProvider>(context).counter.toString(),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<CounterProvider>().incrementCounter();
                },
                child: const Text('Increase'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
