import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 6, // Número de pestañas
        initialIndex: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Acción cuando se presiona el botón de la izquierda
                print('Botón de la izquierda presionado');
              },
              iconSize: 30.0, // Tamaño del icon
            ),
            flexibleSpace: Center(
              child: Image.asset(
                'assets/el-pais-logo 1.png',
                height: 30, // ajusta la altura según tus necesidades
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Acción cuando se presiona el botón de la derecha
                  print('Botón de la derecha presionado');
                },
                iconSize: 30.0, // Tamaño del icon
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(0), // Altura del borde inferior
              child: Container(
                color: Colors.grey, // Color del borde inferior
                height: 0.7, // Altura del borde inferior
              ),
            ),
          ),
          body: Column(
            children: [
              // Barra de pestañas personalizada
              Container(
                height: 30.0,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey, width: 1.0), // Adjust the thickness here
                  ),
                ),
                child: TabBar(
                  padding: EdgeInsets.all(0),
                  tabAlignment: TabAlignment.start,
                  indicatorColor: Colors.black,
                  labelStyle: TextStyle(
                    color: Colors.black, // Color del texto de la pestaña seleccionada
                    fontWeight: FontWeight.bold, // Negrita
                  ),
                  unselectedLabelStyle: TextStyle(
                    color: Colors.grey, // Color del texto de las pestañas no seleccionadas
                    fontWeight: FontWeight.w300, // Light
                  ),
                  tabs: [
                    Tab(text: 'OPINIÓN'),
                    Tab(text: 'ESPAÑA'),
                    Tab(text: 'ECONOMÍA'),
                    Tab(text: 'SOCIEDAD'),
                    Tab(text: 'EDUCACIÓN'),
                    Tab(text: 'MEDIO AMBIENTE'),
                  ],
                  isScrollable: true,
                ),
                
              ),
              //  Contenido de las pestañas
              Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Text('OPINIÓN')),
                    Center(child: Text('ESPAÑA')),
                    Center(child: Text('ECONOMÍA')),
                    Center(
                      child: Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: ListView(
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                "1 MAR 2024 | Actualizado 12:34 CET"
                              ),
                              Padding(padding: EdgeInsets.all(8.0)),
                              
                                Image.asset(
                                  'assets/foto_noticia.png',
                                  fit: BoxFit.fill
                                ),
                              
                              Padding(padding: EdgeInsets.all(8.0)),
                              Text(
                                textAlign: TextAlign.start,
                                "El misterio tras el telón: Sabotage en Mamma Mía!",
                                style: TextStyle(
                                  fontSize: 24.0,
                                  fontFamily: 'Times New Roman',
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.justify,
                                "El viernes pasado, la esperada presentación de Mamma Mia! en el Teatro Rialto, Madrid, se vio empañada por un misterioso sabotaje que amenazaba con opacar la función. Hugo, conocido como el detective especializado en obras artísticas y musicales, fue convocado para resolver el enigma que oscurecía el escenario. Entre luces intermitentes y sonidos desafinados, el equipo técnico y los actores se enfrentaron a una situación caótica minutos antes del estreno. Para recabar la máxima información posible se les interrogó a varios de los testigos que estuvieron presentes. Según Carmela, bailarina principal, tras la explosión de humo, se encontró un maletín en el centro del escenario que contenía una caja. El equipo técnico, al abrir la caja, encontró una nota intrigante entre partituras revueltas y cables cortados. El enigmático mensaje rezaba: La llave que buscas para abrir la caja, la tiene una persona de este lugar, pero ves con cuidado, no todos son como parecen, por muy sencillo que parezca, puede que tengas que buscar por donde menos te lo esperas para que te otorgue la llave que tanto deseas. <A pesar de los esfuerzos de la policía, la llave aún no ha sido encontrada. Sin embargo Hugo continúa su búsqueda, entrevistando a los actores para desentrañar el código oculto en la nota y descubrir quién posee la llave y qué secreto guarda la misteriosa caja. La intriga persiste en el Teatro Rialto, y los amantes del arte y la música aguardan ansiosos el desenlace de este enigma en el vibrante mundo de Mamma Mia!."
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Center(child: Text('EDUCACIÓN')),
                    Center(child: Text('MEDIO AMBIENTE')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}