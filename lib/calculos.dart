import 'package:matrix2d/matrix2d.dart';

Matrix2d m2d = const Matrix2d();

List multiplicacao(List matriz1, List matriz2) {
  List resultado = m2d.dot(matriz1, matriz2);
  print(resultado);

  return resultado;
}
