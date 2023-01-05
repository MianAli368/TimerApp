import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
   
          primarySwatch: Colors.blue,
        ),
        home: const TimerApp());
  }
}

class TimerApp extends StatefulWidget {
  const TimerApp({super.key});

  @override
  State<TimerApp> createState() => _TimerAppState();
}

class _TimerAppState extends State<TimerApp> {

  // Counter to use it in Time Counting.
  late int counter;
  late Timer timer;

  void startTimer() {
    counter = 15;
    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (counter > 0) {
        setState(() {
          counter = counter - 1;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("All widgets building...");
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: const Text("Timer App")),
      body: SizedBox(
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "$counter",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  startTimer();
                },
                child: const Text("Start Timer")),
            ElevatedButton(
                onPressed: counter != 0
                    ? null
                    : () {
                        timer.cancel();
                      },
                child: const Text("Pause Time")),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    timer.cancel();
                    counter = 15;
                  });
                },
                child: const Text("Reset Time"))
          ],
        ),
      ),
    ));
  }
}
