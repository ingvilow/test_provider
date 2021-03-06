import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//я не совсем поняла, что имелось ввиду: из другого файла же нельзя получить доступ к провайдеру.
//На первом экране у меня провайдер объявлен поверх material app,
//потом в my_home_page я использую final counterProvider = Provider.of<CounterProvider>(context);
//имелось ввиду, смогу ли я на третьем экране получить как-то значения из этого
// final counterProvider = Provider.of<CounterProvider>(context); ?
//если так, то они же в разных файлах и не получится так

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
            onPressed: () {
              context.watch<CounterProvider>().incrementCounter();
            },
            child: const Text('Increase'),
          ),
        ],
      ),
    );
  }
}
