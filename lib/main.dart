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
  var desc =
      """La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé
entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort
le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa
Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à
l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à
Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci.
La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre
d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par
ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau
l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout
cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au
monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le
diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier
quotidiennement""";
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
          Visibility(
            visible: _showDescription,
            child: Text(desc),
          ),
        ]));
  }
}
