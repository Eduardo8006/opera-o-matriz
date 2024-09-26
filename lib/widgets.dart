import 'package:flutter/material.dart';
import 'package:operacaomatriz/calculos.dart';
import 'package:operacaomatriz/home.dart';

String textoMatriz1 = '';
String textoMatriz2 = '';
TextEditingController controller1 = TextEditingController();
TextEditingController controller2 = TextEditingController();

class Telinha extends StatefulWidget {
  const Telinha({super.key});

  @override
  State<Telinha> createState() => _TelinhaState();
}

class _TelinhaState extends State<Telinha> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Future telinha(context, String matrizSelecionada, bool value) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width + 30,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    matrizSelecionada,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...geraPalavrasClicaveis(
                              (value ? matriz1 : matriz2), value, context)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 80,
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 0),
                    child: TextFormField(
                      controller: value ? controller1 : controller2,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        label: Text(
                          'Linha 0',
                          style: TextStyle(color: Colors.black45),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        String valor = (value ? controller1 : controller2).text;

                        if (valor.isNotEmpty) {
                          List lista = valor.split(' ');
                          lista = lista.map((data) => int.parse(data)).toList();
                          value ? matriz1.add(lista) : matriz2.add(lista);
                          (value ? controller1 : controller2).text = '';

                          Navigator.pop(context);
                          telinha(context, matrizSelecionada, value);
                        }
                      },
                      child: Text("proximo")),
                ],
              ),
            ));
      });
}
