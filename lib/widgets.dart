import 'package:flutter/material.dart';
import 'package:operacaomatriz/calculos.dart';
import 'package:flutter/services.dart';
import 'package:operacaomatriz/monta_matrizes.dart';

String textoMatriz1 = '';
String textoMatriz2 = '';
TextEditingController controller1 = TextEditingController();
TextEditingController controller2 = TextEditingController();
int? limiteCaracteres1;
int? limiteCaracteres2;

Future telinha(context, String matrizSelecionada, bool value) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width + 30,
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    matrizSelecionada,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ...geraPalavrasClicaveis(value ? matriz1 : matriz2,
                              value, context, value ? controller1 : controller2)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 80,
                    padding: const EdgeInsets.fromLTRB(30, 15, 30, 0),
                    child: TextFormField(
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'[0-9\s\.\+\-\*/]')),
                      ],
                      controller: value ? controller1 : controller2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: const Text(
                          'Linha 0',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        String valor = (value ? controller1 : controller2).text;
                        adicionaItensMatriz(valor, value, context, matrizSelecionada);
                      },
                      child: const Text("proximo")),
                ],
              ),
            ));
      });
}
