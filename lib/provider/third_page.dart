import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/provider/counter_provider.dart';

///третья страница

//я не совсем поняла, что имелось ввиду: из другого файла же нельзя получить доступ к провайдеру.
//На первом экране у меня провайдер объявлен поверх material app,
//потом в my_home_page я использую final counterProvider = Provider.of<CounterProvider>(context);
//имелось ввиду, смогу ли я на третьем экране получить как-то значения из этого final counterProvider = Provider.of<CounterProvider>(context); ?
//если так, то они же в разных файлах и не получится так

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print('stop');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Page'),
      ),
      body: Column(
        children: [
          /*  Consumer<Counter>(
            builder: (ctx, value, child) {
              if (kDebugMode) {
                print('stop 1');
              }
              return Text(
                value.counter.toString(),
              );
            },
          ),*/
          Text(context.watch<Counter>().counter.toString()),
          ElevatedButton(
            onPressed: () {
              context.read<Counter>().incrementCounter();
            },
            child: const Text('Increase'),
          ),
        ],
      ),
    );
  }
}
