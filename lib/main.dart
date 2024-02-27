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

                      child: Column(
                        children: [
                          Text(
                            "1 MAR 2024 | Actualizado 12:34 CET",
                          ),
                          Image.asset('assets/foto_noticia.png'),
                        ],
                      )
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