import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Array con los mapas de los lugares
final places = [
  {
    'place': 'Tikal',
    'description': 'Civilización maya en su máxima expresión',
    'image': 'assets/image1.jpeg',
  },
  {
    'place': 'Atitlán',
    'description': 'El lago más hermoso del mundo',
    'image': 'assets/image2.jpeg',
  },
  {
    'place': 'Semuc',
    'description': 'Un paraiso natural en medio del bosque',
    'image': 'assets/image3.jpeg',
  },
  {
    'place': 'Xela',
    'description': 'La cuna de la cultura y de los mejores ingenieros',
    'image': 'assets/image4.jpeg',
  },
];

// Array con los mapas de actividades
final activities = [
  {
    'name': 'Volcán Tajumulco',
    'duration': '2 días',
    'price': 'Q.325',
    'image': 'assets/image5.jpeg'
  },
  {
    'name': 'Cultura en el altiplano',
    'duration': '3 días',
    'price': 'Q.570',
    'image': 'assets/image6.jpeg'
  },
  {
    'name': 'Camping Tecpán',
    'duration': '3 días',
    'price': 'Q.430',
    'image': 'assets/image7.jpeg'
  },
  {
    'name': 'Sendero en Todos Santos',
    'duration': '1 día',
    'price': 'Q.270',
    'image': 'assets/image8.jpeg'
  },
];
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Parcial 2',
      theme: ThemeData(
        // Definición de la familia de la fuente
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
          // Estilo de fuente para texto de Guatemala
          headline6: TextStyle(
            color: Colors.black,
            fontSize: 36,
            fontWeight: FontWeight.w700,
          ),
          // Estilo de fuente para texto de Corazón del mundo maya
          subtitle1: TextStyle(
            color: Color(0xFF727272),
            fontSize: 15.5,
            fontWeight: FontWeight.w400,
          ),
          // Estilo de fuente para texto de nombres de lugares en carrousel principal
          headline5: TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.w500,
          ),
          // Estilo de fuente para texto de descripción de lugares eb carrousel principal
          bodyText1: TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
          // Estilo de fuente para texto de nombres de lugares en carrousel principal
          headline4: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: Body(),
    );
  }
}

// Widget principal, contiene todo el cuerpo de la app
class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Textos superiores
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Column(
                children: [
                  Text(
                    'Guatemala',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Text(
                    'Corazón del mundo maya',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ],
              ),
            ),
            // Carrousel principal con las fotos de los lugares
            Padding(
              padding: const EdgeInsets.only(
                top: 45.0,
              ),
              child: Container(
                height: 248,
                // Para que no tenga el problema de overflow se utiliza Expanded, el cual llena todo el espacio disponible.
                child: Expanded(
                  // Lista que retorna en cada iteración las tarjetas de lugares 
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    // itemCount recibe el largo del array de lugares. En ese caso 4
                    itemCount: places.length,
                    padding: const EdgeInsets.only(left: 32.0, right: 10.0),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 26.0),
                        // Retorna las tarjetas de lugares según el índice.
                        child: PlacesCard(indexPlaces: index),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Titulo de sección dos Actividades
            Padding(
              padding:
                  const EdgeInsets.only(left: 32.0, top: 48.0, bottom: 30.0),
              child: Text(
                'Actividades',
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 24),
                    // copyWith sirve para reutilizar un tema 
                    // solo cambiando algunas propiedades
              ),
            ),
            // Carrousel secundario
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    // al igual que en el carrusel primario se retornan
                    // las tarjetas de actividades según el índice
                    child: ActivitiesCard(indexActivities: index,),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActivitiesCard extends StatelessWidget {
  final int indexActivities;
  const ActivitiesCard({
    required this.indexActivities,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Container(
        height: 86,
        width: 320,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(activities.elementAt(indexActivities)['image'].toString()),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
          // Sirve para hacer el fade de negro a transparente 
          // y así hacer que se lea mejor el texto
            gradient: LinearGradient(
              colors: [
                Colors.black87,
                Colors.transparent,
                Colors.transparent,
                Colors.black87
              ],
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              stops: [0, 0, 0.3, 1],
            ),
            // Para que no se note fuera de las esquinas
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 13.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 117,
                  child: Text(
                    activities.elementAt(indexActivities)['name'].toString(),
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:13.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        activities.elementAt(indexActivities)['duration'].toString(),
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(fontSize: 14),
                      ),
                      Text(
                        activities.elementAt(indexActivities)['price'].toString(),
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlacesCard extends StatelessWidget {
  final int indexPlaces;
  const PlacesCard({
    required this.indexPlaces,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 164,
      height: 248,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(places.elementAt(indexPlaces)['image'].toString()),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black54,
              Colors.transparent,
              Colors.transparent,
              Colors.black54
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0, 0.6, 1],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                places.elementAt(indexPlaces)['place'].toString(),
                style: Theme.of(context).textTheme.headline5,
              ),
              Text(
                places.elementAt(indexPlaces)['description'].toString(),
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
