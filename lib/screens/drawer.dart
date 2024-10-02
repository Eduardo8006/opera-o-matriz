import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:operacaomatriz/calculos/calculos.dart';
import 'package:operacaomatriz/screens/widgets.dart';

Drawer drawer(context) {
  return Drawer(
    child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        color: Colors.grey[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
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
                        child: Center(
                          child: Text(
                            'Menu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                            ),
                          ),
                        )),
                  ),
                  ListTile(
                    leading: const Icon(Icons.close),
                    title: const Text('Multiplicação'),
                    onTap: () {
                      operacaoSelecionada = 'Multiplicação';

                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Adição'),
                    onTap: () {
                      operacaoSelecionada = 'Adição';

                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.remove),
                    title: const Text('Subtração'),
                    onTap: () {
                      operacaoSelecionada = 'Subtração';

                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 15),
              decoration: BoxDecoration(),
              child: CupertinoButton(
                  child: Text(
                    'Sair',
                    style: TextStyle(fontSize: 19, color: Colors.red),
                  ),
                  onPressed: () {
                    showExitConfirmation(context);
                  }),
            )
          ],
        )),
  );
}
