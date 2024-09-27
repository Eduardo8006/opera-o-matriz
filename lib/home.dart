import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:operacaomatriz/calculos.dart';
import 'package:operacaomatriz/resultado.dart';
import 'package:operacaomatriz/widgets.dart';
import 'calculos.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int linhasMatriz1 = 0;
  int linhasMatriz2 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
        ],
        title: const Text("Matrizes"),
        leading: Builder(
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
        child: Container(
          width: MediaQuery.of(context).size.width * 0.5,
          color: Colors.grey[300],
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 150,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                  ),
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                ),
              ),
              ListTile(
                leading: Icon(Icons.add),
                title: Text('Adição'),
                onTap: () {
                  setState(() {
                    operacaoSelecionada = 'Adição';
                  });

                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.remove),
                title: Text('Subtração'),
                onTap: () {
                  setState(() {
                    operacaoSelecionada = 'Subtração';
                  });

                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.close),
                title: Text('Multiplicação'),
                onTap: () {
                  setState(() {
                    operacaoSelecionada = 'Multiplicação';
                  });

                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  FontAwesomeIcons.divide,
                  size: 19,
                ),
                title: Text('Divisão'),
                onTap: () {
                  setState(() {
                    operacaoSelecionada = 'Divisão';
                  });

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              operacaoSelecionada,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Primeira Matriz",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 250,
              child: CupertinoButton(
                  color: Colors.blueGrey,
                  child: Text(matriz1.isEmpty ? 'Adicionar Matriz' : 'Editar'),
                  onPressed: () async {
                    await telinha(context, "Matriz 1", true);
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              height: 170,
              width: 230,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [...Extraimatriz(matriz1)],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Segunda Matriz",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 250,
              child: CupertinoButton(
                  color: Colors.blueGrey,
                  child: Text(matriz1.isEmpty ? 'Adicionar Matriz' : 'Editar'),
                  onPressed: () async {
                    await telinha(context, "Matriz 2", false);
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              height: 170,
              width: 230,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [...Extraimatriz(matriz2)],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 250,
              child: CupertinoButton(
                child: Text("Calcular"),
                onPressed: () {
                  mostrarResultado(context);
                },
                color: Colors.blueGrey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
