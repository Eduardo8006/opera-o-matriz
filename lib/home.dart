import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Text('substituir depois'),
        ],
        title: const Text("Matrizes"),
        leading: Builder(
          // Usando Builder para garantir o contexto correto
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(
                Icons.menu,
                size: 30,
              ),
            );
          },
        ),
      ),
      drawer: Drawer(
        // Barra lateral expansível
        child: Container(
          width:
              MediaQuery.of(context).size.width * 0.5, // Ocupa metade da tela
          color: Colors.grey[300],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              // Alterando o tamanho da área azul no DrawerHeader
              SizedBox(
                height: 150, // Defina a altura desejada para o DrawerHeader
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.teal, // Cor azul
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  margin: EdgeInsets.zero, // Remove a margem do DrawerHeader
                  padding: EdgeInsets.zero, // Remove o padding do DrawerHeader
                ),
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text('Ação'),
                onTap: () {
                  Navigator.pop(context); // Fecha o drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.remove),
                title: Text('Subtração'),
                onTap: () {
                  Navigator.pop(context); // Fecha o drawer
                },
              ),
              ListTile(
                leading: Icon(Icons.close),
                title: Text('multiplicação'),
                onTap: () {
                  Navigator.pop(context); // Fecha o drawer
                },
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.divide,
                  size: 19,
                ),
                title: Text('Divisão'),
                onTap: () {
                  Navigator.pop(context); // Fecha o drawer
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.blue,
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
