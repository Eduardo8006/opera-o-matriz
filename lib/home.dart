import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operacaomatriz/calculos.dart';
import 'package:operacaomatriz/creditos.dart';
import 'package:operacaomatriz/monta_matrizes.dart';
import 'package:operacaomatriz/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int linhasMatriz1 = 0;
  int linhasMatriz2 = 0;

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                matriz1.clear();
                matriz2.clear();
                setState(HomePage.new);
              },
              icon: const Icon(Icons.replay_outlined)),
          PopupMenuButton<String>(
              color: Colors.white,
              padding: const EdgeInsets.all(8),
              onSelected: (String value) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CreditoPage()),
                );
              },
              itemBuilder: (BuildContext context) {
                return [
                  const PopupMenuItem<String>(
                    value: '1',
                    child: Text(
                      'Sobre',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const PopupMenuItem<String>(
                    value: '2',
                    child: Text(
                      'Créditos',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  )
                ];
              })
        ],
        title: const Text("Matrizes"),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
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
              const SizedBox(
                height: 150,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.teal,
                  ),
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  child: Text(
                    'Menu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.close),
                title: const Text('Multiplicação'),
                onTap: () {
                  setState(() {
                    operacaoSelecionada = 'Multiplicação';
                  });

                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.add),
                title: const Text('Adição'),
                onTap: () {
                  setState(() {
                    operacaoSelecionada = 'Adição';
                  });

                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.remove),
                title: const Text('Subtração'),
                onTap: () {
                  setState(() {
                    operacaoSelecionada = 'Subtração';
                  });

                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              operacaoSelecionada,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Primeira Matriz",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 250,
              child: CupertinoButton(
                  color: Colors.blueGrey,
                  child: Text(matriz1.isEmpty ? 'Adicionar Matriz' : 'Editar'),
                  onPressed: () async {
                    await telinha(context, "Matriz 1", true);
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  height: 170,
                  width: 230,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [...Extraimatriz(matriz1)],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: -7,
                    right: -7,
                    child: IconButton(
                      onPressed: () {
                        matriz1.clear();
                        setState(HomePage.new);
                      },
                      icon: const Icon(Icons.delete_outline),
                      iconSize: 30,
                      color: Colors.black54,
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Segunda Matriz",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 250,
              child: CupertinoButton(
                  color: Colors.blueGrey,
                  child: Text(matriz2.isEmpty ? 'Adicionar Matriz' : 'Editar'),
                  onPressed: () async {
                    await telinha(context, "Matriz 2", false);
                  }),
            ),
            const SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.grey)),
                  height: 170,
                  width: 230,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [...Extraimatriz(matriz2)],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    top: -7,
                    right: -7,
                    child: IconButton(
                      onPressed: () {
                        matriz2.clear();
                        setState(HomePage.new);
                      },
                      icon: const Icon(Icons.delete_outline),
                      iconSize: 30,
                      color: Colors.black54,
                    ))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 250,
              child: CupertinoButton(
                onPressed: () {
                  mostrarResultado(context);
                },
                color: Colors.blueGrey,
                child: const Text("Calcular"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
