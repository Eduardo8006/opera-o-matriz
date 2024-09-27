import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operacaomatriz/calculos.dart';

Future Telaresultado(context, List a) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width + 30,
          // color: Colors.blue,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                'resultado',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
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
              SizedBox(
                height: 50,
              ),
              Container(
                width: 220,
                child: CupertinoButton(
                  child: Text(
                    "Fechar",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.blueGrey,
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}
