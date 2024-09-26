import 'package:flutter/material.dart';
import 'package:matrix2d/matrix2d.dart';
import 'package:operacaomatriz/widgets.dart';

Matrix2d m2d = const Matrix2d();
String operacaoSelecionada = 'Multiplicação';
List matriz1 = [];
List matriz2 = [];
List resultado = [];

void definirMatriz(valor, matriz) {
  valor ? matriz1 : matriz2 = matriz;
}

List multiplicacao() {
  resultado = m2d.dot(matriz1, matriz2);

  return resultado;
}

List divisao() {
  resultado = m2d.division(matriz1, matriz2);

  return resultado;
}

List subtracao() {
  resultado = m2d.subtraction(matriz1, matriz2);

  return resultado;
}

List adicao() {
  resultado = m2d.addition(matriz1, matriz2);

  return resultado;
}

List<Widget> Extraimatriz(List matriz) {
  String texto = '';
  List<Widget> widgets = [];
  for (List i in matriz) {
    for (var j in i) {
      texto += j.toString() + '   ';
    }
    if (texto.isNotEmpty) {
      texto = texto.substring(0, texto.length - 1);
    }
    if (texto.isNotEmpty) {
      widgets.add(
        Text(
          texto,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
      texto = '';
    }
  }
  return widgets;
}

List<Widget> geraPalavrasClicaveis(matriz, value, context) {
  String texto = '';
  List<Widget> widgets = [];
  int contador = 0;
  for (List i in matriz) {
    for (var j in i) {
      texto += j.toString() + '   ';
    }
    if (texto.isNotEmpty) {
      texto = texto.substring(0, texto.length - 1);
    }
    if (texto.isNotEmpty) {
      widgets.add(InkWell(
          child: Text(
            texto,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          onTap: () {
            (value ? controller1 : controller2).text = texto;
            Navigator.pop(context);
            telinha(context, (value ? "Matriz 1" : "Matriz 2"), value);
          }));
      texto = '';
    }
  }
  return widgets;
}
