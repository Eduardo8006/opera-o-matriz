import 'package:flutter/material.dart';
import 'package:operacaomatriz/calculos.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List a = [
    [1, 2, 3],
    [2, 3, 4],
    [2, 3, 4]
  ];
  List b = [
    [67, 5, 3],
    [13, 3, 4],
    [8, 6, 5]
  ];

  @override
  void initState() {
    multiplicacao(a, b);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de Matrizes"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(),
          ],
        ),
      ),
    );
  }
}
