import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final animals = [
    {"name": "dog", "image": "images/dog.png", "sound": "dog.wav"},
    {"name": "cat", "image": "images/cat.png", "sound": "cat.wav"},
    {"name": "horse", "image": "images/horse.png", "sound": "horse.wav"},
    {"name": "rooster", "image": "images/rooster.png", "sound": "rooster.wav"}
  ];

  Map<String, String> chosen_animal = {};
  @override
  void initState() {
    super.initState();
    getRandomAnimal();
  }

  getRandomAnimal() {
    int random = Random().nextInt(4);
    setState(() {
      chosen_animal = animals[random];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
        title: const Text("Random Animal With Sound"),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            getRandomAnimal();
            final player = AudioPlayer();
            player.play(AssetSource(chosen_animal["sound"]!));
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(chosen_animal["image"]!),
                  height: 200,
                  width: 100,
                ),
                Text(
                  chosen_animal["name"]!,
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
