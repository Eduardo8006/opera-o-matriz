import 'package:matrix2d/matrix2d.dart';
import 'package:operacaomatriz/resultado.dart';

Matrix2d m2d = const Matrix2d();
String operacaoSelecionada = 'Multiplicação';
List matriz1 = [];
List matriz2 = [];
List resultado = [];
int linhaSelecionada = -1;
void definirMatriz(valor, matriz) {
  valor ? matriz1 : matriz2 = matriz;
}

List multiplicacao() {
  if (m2d.shape(matriz1)[1] == m2d.shape(matriz2)[0]) {
    resultado = m2d.dot(matriz1, matriz2);
  }
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

List? verificaOperacao(String operacao) {
  switch (operacao) {
    case 'Multiplicação':
      return multiplicacao();

    case 'Subtração':
      return subtracao();

    case 'Adição':
      return adicao();

    case 'Divisão':
      return divisao();
    default:
      return null;
  }
}

void mostrarResultado(context) async {
  resultado = [];
  if (matriz1.isNotEmpty && matriz2.isNotEmpty) {
    List a = await verificaOperacao(operacaoSelecionada)!;
    if (a.isEmpty && operacaoSelecionada == 'Multiplicação') {
      telaErro(
          "O número de colunas da primeira matriz precisa ser igual ao numero de linhas da segunda para a multiplicação ser possivel!",
          context);
    } else if (a.isNotEmpty) {
      Telaresultado(context, a);
    }
  } else {
    telaErro('Você presica preencher as 2 matrizes para efetuar o calculo!',
        context);
  }
}
