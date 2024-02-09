import 'package:counter_getx/counter_app.dart';
import 'package:counter_getx/counter_app_state.dart';
import 'package:counter_getx/realtime_input_app.dart';
import 'package:counter_getx/simple_crud_app.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterApp(),
                  ),
                );
              },
              child: const Text('Counter App'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterAppSetState(),
                  ),
                );
              },
              child: const Text('Counter App SetState'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RealtimeInputApp(),
                  ),
                );
              },
              child: const Text('Realtime Input App'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SimpleCrudApp(),
                  ),
                );
              },
              child: const Text('Simple CRUD App'),
            ),
          ],
        ),
      ),
    );
  }
}
