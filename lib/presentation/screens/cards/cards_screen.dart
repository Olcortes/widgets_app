import 'package:flutter/material.dart';

const cards = <Map<String,dynamic>>[//Listado de tarjetas predefinidas
  { 'elevation': 0.0, 'label': 'Elevation 0' },//sin elevación
  { 'elevation': 1.0, 'label': 'Elevation 1' },//Con un poquito de elevacion
  { 'elevation': 2.0, 'label': 'Elevation 2' },
  { 'elevation': 3.0, 'label': 'Elevation 3' },
  { 'elevation': 4.0, 'label': 'Elevation 4' },
  { 'elevation': 5.0, 'label': 'Elevation 5' },
];





class CardsScreen extends StatelessWidget {

  static const String name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(//Para poder hacer scroll dentro del primer hijo, en este caso Column
      child: Column(
        children: [
          
          ...cards.map( 
            (card) => _CardType1( elevation: card['elevation'], label: card['label'] ),
          ),

          ...cards.map( 
            (card) => _CardType2( elevation: card['elevation'], label: card['label'] ),
          ),

          ...cards.map( 
            (card) => _CardType3( elevation: card['elevation'], label: card['label'] ),
          ),

          ...cards.map( 
            (card) => _CardType4( elevation: card['elevation'], label: card['label'] ),
          ),
          
          const SizedBox(height: 50 ),//Esto permite que el scroll no quede parado justo al final sino que deje un espacio
        ],
      ),
    );
  }
}


class _CardType1 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType1({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    return Card(//Es el propio de flutter
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon( Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text( label ),
            )

          ],
        ),
      ),
    );
  }
}


class _CardType2 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType2({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all( Radius.circular(12) ),
        side: BorderSide(
          color: colors.outline
        )
      ),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon( Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )

          ],
        ),
      ),
    );
  }
}



class _CardType3 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType3({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.surfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon( Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),

            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - Filled'),
            )

          ],
        ),
      ),
    );
  }
}



class _CardType4 extends StatelessWidget {

  final String label;
  final double elevation;

  const _CardType4({
    required this.label,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {

    //final colors = Theme.of(context).colorScheme;

    return Card(
      clipBehavior: Clip.hardEdge, //Evita que los hijos se salgan 
      elevation: elevation,
      child: Stack(
        children: [

          Image.network(
            'https://picsum.photos/id/${ elevation.toInt() }/600/350',//trae de picsum de acuerdo al nombre
            height: 350,
            fit: BoxFit.cover,
          ),


          Align(
            alignment: Alignment.topRight,
            child: Container(
              decoration: const BoxDecoration(
                //color: colors.primary,
                color: Colors.yellow,
                borderRadius: BorderRadius.only( bottomLeft: Radius.circular(20) )
              ),
              child: IconButton(//Para ver los 3 punticos dentro de la imagen
                icon: const Icon( Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
          ),


        ],
      ),
    );
  }
}