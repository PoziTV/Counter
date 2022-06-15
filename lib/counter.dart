import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import 'generated/l10n.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key, title}) : super(key: key);

  // final String title = S.of(context).counter;//'Счетчик';

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void changeLocale(String? value) async {
    if (value == 'en') {
      await S.load(
        Locale('en'),
      );
      setState(() {});
    } else {
      await S.load(
        Locale('ru_RU'),
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // print('ssdsds'+Intl.getCurrentLocale());
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).counter),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(S.of(context).language),
              const Padding(
                padding: EdgeInsets.only(left: 10),
              ),
              DropdownButton<String>(
                value: Intl.getCurrentLocale(),
                items: [
                  DropdownMenuItem(
                    value: 'en',
                    child: Text(
                      S.of(context).english,
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'ru_RU',
                    child: Text(
                      S.of(context).russian,
                    ),
                  ),
                ],
                onChanged: changeLocale,
              ),
            ],
          ),
          Spacer(),
          Text(S.of(context).counter_value // 'Значение счетчика',
              ),
          Text(
            '$_counter',
            style: Theme.of(context).textTheme.headline4,
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text('+'), //"Вход"),
              ),
              ElevatedButton(
                onPressed: _decrementCounter,
                child: const Text('-'), //"Вход"),
              )
            ],
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 20)),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
