import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operacaomatriz/montaMatrizes.dart';

// ignore: non_constant_identifier_names
Future Telaresultado(context, List a) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width + 5,
          // color: Colors.blue,
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 10,
              ),
              const Text(
                'resultado',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.center,
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ...Extraimatriz(a),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              SizedBox(
                width: 220,
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.blueGrey,
                  child: const Text(
                    "Fechar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

Future telaErro(String erro, context) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Container(
          margin: EdgeInsets.all(50),
          child: Text(
            erro,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ));
      });
}
