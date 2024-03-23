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

bool? verificaSeApenasNumero(String valor) {
  // Expressão regular para verificar se a string contém apenas números
  final RegExp regex = RegExp(r'^[0-9]+$');

  // Testa se a string satisfaz a expressão regular
  return regex.hasMatch(valor);
}

int? stringParaInt(String parcelas) {
  return int.parse(parcelas);
}

DateTime? adicionarMeses(
  DateTime data,
  int meses,
) {
  int year = data.year;
  int month = data.month + meses;
  int day = data.day;

  // Se o mês for maior que 12, ajuste para janeiro do próximo ano.
  while (month > 12) {
    month -= 12;
    year++;
  }

  // Verifique se o dia existe no mês atual, senão pegue o último dia do mês.
  if (day > DateTime(year, month + 1, 0).day) {
    day = DateTime(year, month + 1, 0).day;
  }

  return DateTime(year, month, day, data.hour, data.minute, data.second,
      data.millisecond, data.microsecond);
}

double? numeroPositivo(double num) {
  return num.abs();
}

String? letrasMaiusculas(String texto) {
  return texto.replaceAll(RegExp(r'\s+'), ' ').trim().toUpperCase();
}

DateTime? stringParaDateTime(String data) {
  return DateTime.parse(data);
}

DateTime? subtrairMeses(
  DateTime data,
  int meses,
) {
  int year = data.year;
  int month = data.month - meses;
  int day = data.day;

  // Se o mês for menor que 1, ajuste para dezembro do ano anterior.
  while (month < 1) {
    month += 12;
    year--;
  }

  // Verifique se o dia existe no mês atual, senão pegue o último dia do mês.
  if (day > DateTime(year, month + 1, 0).day) {
    day = DateTime(year, month + 1, 0).day;
  }

  return DateTime(year, month, day, data.hour, data.minute, data.second,
      data.millisecond, data.microsecond);
}

List<int>? gerarListaDeAnos(int ano) {
  List<int> listaDeAnos = [];
  for (int i = ano - 2; i <= ano + 2; i++) {
    listaDeAnos.add(i);
  }
  return listaDeAnos;
}

int? obterAno(DateTime data) {
  return data.year;
}

List<String>? gerarListaDeMeses(String mes) {
  List<String> meses = [
    'Dezembro',
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro',
    'Janeiro',
    'Fevereiro'
  ];
  int index = meses.indexOf(mes);

  if (index != 0) {
    return meses.sublist(index - 1, index + 2);
  } else {
    return ['Novembro', 'Dezembro', 'Janeiro'];
  }
}

String? obterMes(DateTime data) {
  List<String> meses = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];
  return meses[data.month - 1];
}

double? somarListaDouble(List<double> valores) {
  return valores.reduce((valor1, valor2) => valor1 + valor2);
}

String? mesParaNumero(String mes) {
  switch (mes.toLowerCase()) {
    case 'janeiro':
      return '01';
    case 'fevereiro':
      return '02';
    case 'março':
      return '03';
    case 'abril':
      return '04';
    case 'maio':
      return '05';
    case 'junho':
      return '06';
    case 'julho':
      return '07';
    case 'agosto':
      return '08';
    case 'setembro':
      return '09';
    case 'outubro':
      return '10';
    case 'novembro':
      return '11';
    case 'dezembro':
      return '12';
    default:
      return 'Mês inválido';
  }
}
