import 'package:flutter/material.dart';
import 'package:operacaomatriz/calculos/calculos.dart';
import 'package:operacaomatriz/calculos/resultado.dart';
import 'package:operacaomatriz/screens/widgets.dart';

void adicionaItensMatriz(String valor, bool value, context, matrizSelecionada) {
  if (valor.isNotEmpty) {
    if (valor[valor.length - 1] == ' ') {
      valor = valor.substring(0, valor.length - 1);
    }
    List<int> lista = valor
        .split(
          ' ',
        )
        .map((data) => int.parse(data))
        .toList();
    if (value ? matriz1.isNotEmpty : matriz2.isNotEmpty) {
      if (lista.length != (value ? matriz1[0].length : matriz2[0].length)) {
        telaErro('Erro no numero de Colunas!', context);
        return;
      }
    }

    if (linhaSelecionada == -1) {
      value
          ? linhasMatriz1 = matriz1.length + 2
          : linhasMatriz2 = matriz2.length + 2;

      value ? matriz1.add(lista) : matriz2.add(lista);
    } else {
      value
          ? linhasMatriz1 = linhaSelecionada
          : linhasMatriz2 = linhaSelecionada;
      if ((value ? linhasMatriz1 : linhasMatriz2) == 0) {
        value ? linhasMatriz1 = 1 : linhasMatriz2 = 1;
      }
      value
          ? matriz1[linhaSelecionada] = lista
          : matriz2[linhaSelecionada] = lista;
      linhaSelecionada = -1;
    }
    if (matriz1.isNotEmpty) {
      limiteCaracteres1 = matriz1[0].length * 2 - 1;
    }
    if (matriz2.isNotEmpty) {
      limiteCaracteres2 = matriz2[0].length * 2 - 1;
    }
    (value ? controller1 : controller2).clear();

    Navigator.pop(context);
    telinha(context, matrizSelecionada, value);
  }
}

// ignore: non_constant_identifier_names
List<Widget> Extraimatriz(List matriz) {
  String texto = '';
  List<Widget> widgets = [];
  for (List i in matriz) {
    for (var j in i) {
      texto += '$j   ';
    }
    if (texto.isNotEmpty) {
      texto = texto.substring(0, texto.length - 1);
    }
    if (texto.isNotEmpty) {
      widgets.add(
        Text(
          texto,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
      );
      texto = '';
    }
  }
  return widgets;
}

List<Widget> geraPalavrasClicaveis(matriz, bool value, BuildContext context,
    TextEditingController controller) {
  String texto = '';
  List<Widget> widgets = [];

  for (int i = 0; i < matriz.length; i++) {
    texto = matriz[i].join('   ');

    if (texto.isNotEmpty) {
      widgets.add(InkWell(
          child: Text(
            texto,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          onTap: () {
            linhaSelecionada = i;
            value
                ? linhasMatriz1 = linhaSelecionada + 1
                : linhasMatriz2 = linhaSelecionada + 1;
            controller.text = matriz[linhaSelecionada].join(' ');
            Navigator.pop(context);
            telinha(context, (value ? "Matriz 1" : "Matriz 2"), value);
          }));
      texto = '';
    }
  }
  return widgets;
}
