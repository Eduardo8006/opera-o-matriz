import 'package:matrix2d/matrix2d.dart';

Matrix2d m2d = Matrix2d();

List multiplicacao(List matriz1, List matriz2) {
  List resultado = m2d.dot(matriz1, matriz2);

  return resultado;
}

List divisao(List matriz1, List matriz2) {
  List resultado = m2d.division(matriz1, matriz2);

  return resultado;
}

List subtracao(List matriz1, List matriz2) {
  List resultado = m2d.subtraction(matriz1, matriz2);

  return resultado;
}

List adicao(List matriz1, List matriz2) {
  List resultado = m2d.addition(matriz1, matriz2);

  return resultado;
}
