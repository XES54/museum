import 'package:flutter/material.dart';

void main() {
  runApp(const MuseumApp());
}

class MuseumApp extends StatelessWidget {
  const MuseumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "museum",
      theme: ThemeData(primaryColor: const Color.fromARGB(218, 4, 218, 54)),
      home: const Artwork(),
    );
  }
}

class Artwork extends StatefulWidget {
  const Artwork({super.key});

  @override
  State<Artwork> createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  bool _isFavorite = false;
  bool _showDescription = false;
  var snackbar = const SnackBar(
    content: Text('Oeuvre ajoutée à vos favoris'),
    duration: Duration(seconds: 1),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Museum'),
          backgroundColor: const Color.fromARGB(255, 54, 16, 0),
        ),
        body: Column(children: [
          Stack(alignment: Alignment.center, children: [
            Image.asset('assets/images/Mona_Lisa.jpg'),
            Icon(
              Icons.favorite,
              size: 100,
              color: _isFavorite
                  ? const Color.fromARGB(255, 238, 2, 2)
                  : const Color.fromARGB(190, 255, 255, 255),
            ),
          ]),
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
          Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
                icon: const Icon(Icons.article),
                onPressed: () {
                  setState(() {
                    _showDescription = !_showDescription;
                  });
                }),
            IconButton(
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border_sharp,
                color: const Color.fromARGB(255, 54, 16, 0),
              ),
              onPressed: () {
                if (!_isFavorite) {
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
                setState(() {
                  _isFavorite = !_isFavorite;
                });
              },
            )
          ]),
        ]));
  }
}
