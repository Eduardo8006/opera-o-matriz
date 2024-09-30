import 'package:flutter/material.dart';

class CreditoPage extends StatelessWidget {
  const CreditoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Créditos',
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 0, 15, 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        textAlign: TextAlign.center,
                        'Créditos',
                        style: TextStyle(
                            color: Color.fromARGB(255, 195, 53, 43),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Aplicativo desenvolvido por Eduardo e Julio Cesar',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'sobre',
                        style: TextStyle(
                            color: Color.fromARGB(255, 195, 53, 43),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        'Este aplicativo foi desenvolvido com o intuito de auxiliar os alunos do curso de informatica na materia de matematica',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}
