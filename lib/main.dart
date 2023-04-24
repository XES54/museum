import 'package:flutter/material.dart';

void main() {
  runApp(const MuseumApp());
}

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "museum", // in logical pixels
      theme: ThemeData(primaryColor: const Color.fromARGB(218, 4, 218, 54)),
      home: const Artwork(),
    );
  }
}

class Artwork extends StatelessWidget {
  const Artwork({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Museum'),
          backgroundColor: const Color.fromARGB(255, 54, 16, 0),
        ),
        body: Column(children: [
          const Icon(Icons.favorite),
          Image.asset('assets/images/Mona_Lisa.jpg'),
          const Text('Mona Lisa',
              style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Merriweather',
                  color: Color.fromARGB(255, 54, 16, 0))),
          const Text('Léonard De Vinci',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Merriweather',
                color: Color.fromARGB(255, 54, 16, 0),
                fontWeight: FontWeight.bold,
              )),
        ]));
  }
}