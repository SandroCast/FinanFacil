import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/sqlite/sqlite_manager.dart';

double? salvaPrecoBanco(String? valor) {
  String precoSemPontos = valor!.replaceAll('.', '');

  String valorDouble = precoSemPontos.replaceAll(',', '.');

  String retiraMoeda = valorDouble.replaceAll('R\$ ', '');

  return double.tryParse(retiraMoeda);
}

int? converterDoubleParaInt(double? valor) {
  // Se o valor for nulo ou 0, retorna null
  if (valor == 0) {
    return 0;
  }

  // Multiplica por 100 para manter os dois primeiros dígitos decimais
  int numeroInteiro = (valor! * 100).round();

  // Remove os zeros à esquerda
  String resultadoString =
      numeroInteiro.toString().replaceAll(RegExp('^0+'), '');

  // Converte de volta para inteiro
  int resultado = int.parse(resultadoString);

  return resultado;
}

String? converteValorParaReal(String? valor) {
  if (valor == '') {
    return 'R\$ 0,00';
  }

  // Converte o valor inteiro em uma string.
  String valorStr = valor!.replaceAll(',', '');

  valorStr = valorStr.replaceAll('.', '');

  int valorInt = int.parse(valorStr);

  valorStr = valorInt.toString();

  // Verifica o comprimento da string e adiciona vírgulas conforme necessário.
  if (valorStr.length <= 2) {
    return 'R\$ ' + '0,${valorStr.padLeft(2, '0')}';
  } else {
    int index = valorStr.length - 2;
    String parteInteira = valorStr.substring(0, index);
    String parteDecimal = valorStr.substring(index);

    // Adiciona pontos a cada três dígitos na parte inteira.
    final buffer = StringBuffer();
    for (int offset = 0; offset < parteInteira.length; offset++) {
      buffer.write(parteInteira[parteInteira.length - offset - 1]);
      if (offset % 3 == 2 && offset != parteInteira.length - 1) {
        buffer.write('.');
      }
    }
    parteInteira = buffer.toString().split('').reversed.join();

    return 'R\$ ' + '$parteInteira,$parteDecimal';
  }
}