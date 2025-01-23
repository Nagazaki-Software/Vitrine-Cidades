import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<SeusprodutosRecord> buscarPorRegiao(
  List<SeusprodutosRecord> produtos,
  LatLng localizacaoDoUsuario,
  double localizacaoMaxima,
) {
  // First create some emptyList
  List<SeusprodutosRecord> placesList = [];
  List<double> listKm = [];
  double lat1 = localizacaoDoUsuario.latitude;
  double lon1 = localizacaoDoUsuario.longitude;
  // This iterates through the single documents "places" in the List
  for (SeusprodutosRecord produto in produtos) {
    if (produto.localizacaoDoComerciante != null) {
      double lat2 = produto.localizacaoDoComerciante!.latitude;
      double lon2 = produto.localizacaoDoComerciante!.longitude;
      // Rest of the  calculation logic remains unchanged
      // Ensure to keep the rest of the code intact
      var c = math.cos;
      var p = 0.017453292519943295;
      var a = 0.5 -
          c((lat2 - lat1) * p) / 2 +
          c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
      // This is getting us the distance
      var d = (12742 * math.asin(math.sqrt(a)));
      String inString = d.toStringAsFixed(2); // '2.35'
      double inDouble = double.parse(inString);
      listKm.add(inDouble);
      // Sort the documents that will be returned by distance
      listKm.sort();
      int listKmIndex = listKm.indexWhere((dist) => dist == inDouble);
      // Check if the document we are currently processing is no farther away from userGeo than we defined as max.
      if (inDouble <= localizacaoMaxima) {
        // If its within our radius, add it to the list of places documents that will be returned
        placesList.insert(listKmIndex, produto);
      }
    }
  }

  return placesList;
}

String? abrirWhatsapp(String? number) {
  if (number != null) {
    final String phoneNumber = number;
    final String txtForEmpresas =
        "Olá, vi seu anúncio no app Vitrine Cidades, queria saber mais sobre o produto.";
    final String url =
        'https://api.whatsapp.com/send?phone=55$phoneNumber&text=$txtForEmpresas';
    return url;
  }
}

int? adiciona1Seguidor(int? quantidade) {
  // loop integer quantidade
  if (quantidade == null || quantidade <= 0) {
    return null;
  }
  int count = 0;
  for (int i = 1; i <= quantidade; i++) {
    count++;
  }
  return count;
}

List<SearchsRecord> buscarPorRegiaoSearch(
  List<SearchsRecord> produtos,
  LatLng localizacaoDoUsuario,
  double localizacaoMaxima,
) {
// First create some emptyList
  List<SearchsRecord> placesList = [];
  List<double> listKm = [];
  double lat1 = localizacaoDoUsuario.latitude;
  double lon1 = localizacaoDoUsuario.longitude;
  // This iterates through the single documents "places" in the List
  for (SearchsRecord produto in produtos) {
    if (produto.localizacaoDoComerciante != null) {
      double lat2 = produto.localizacaoDoComerciante!.latitude;
      double lon2 = produto.localizacaoDoComerciante!.longitude;
      // Rest of the  calculation logic remains unchanged
      // Ensure to keep the rest of the code intact
      var c = math.cos;
      var p = 0.017453292519943295;
      var a = 0.5 -
          c((lat2 - lat1) * p) / 2 +
          c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
      // This is getting us the distance
      var d = (12742 * math.asin(math.sqrt(a)));
      String inString = d.toStringAsFixed(2); // '2.35'
      double inDouble = double.parse(inString);
      listKm.add(inDouble);
      // Sort the documents that will be returned by distance
      listKm.sort();
      int listKmIndex = listKm.indexWhere((dist) => dist == inDouble);
      // Check if the document we are currently processing is no farther away from userGeo than we defined as max.
      if (inDouble <= localizacaoMaxima) {
        // If its within our radius, add it to the list of places documents that will be returned
        placesList.insert(listKmIndex, produto);
      }
    }
  }

  return placesList;
}

List<AnuncioRecord> buscarPorRegiaoAnuncios(
  List<AnuncioRecord> produtos,
  LatLng localizacaoDoUsuario,
  double localizacaoMaxima,
) {
  // First create some emptyList
  List<AnuncioRecord> placesList = [];
  List<double> listKm = [];
  double lat1 = localizacaoDoUsuario.latitude;
  double lon1 = localizacaoDoUsuario.longitude;
  // This iterates through the single documents "places" in the List
  for (AnuncioRecord produto in produtos) {
    if (produto.localizacaoDoComerciante != null) {
      double lat2 = produto.localizacaoDoComerciante!.latitude;
      double lon2 = produto.localizacaoDoComerciante!.longitude;
      // Rest of the  calculation logic remains unchanged
      // Ensure to keep the rest of the code intact
      var c = math.cos;
      var p = 0.017453292519943295;
      var a = 0.5 -
          c((lat2 - lat1) * p) / 2 +
          c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
      // This is getting us the distance
      var d = (12742 * math.asin(math.sqrt(a)));
      String inString = d.toStringAsFixed(2); // '2.35'
      double inDouble = double.parse(inString);
      listKm.add(inDouble);
      // Sort the documents that will be returned by distance
      listKm.sort();
      int listKmIndex = listKm.indexWhere((dist) => dist == inDouble);
      // Check if the document we are currently processing is no farther away from userGeo than we defined as max.
      if (inDouble <= localizacaoMaxima) {
        // If its within our radius, add it to the list of places documents that will be returned
        placesList.insert(listKmIndex, produto);
      }
    }
  }

  return placesList;
}

List<PrestadoresDeServicosRecord> buscarPorRegiaoPrestador(
  List<PrestadoresDeServicosRecord> produtos,
  LatLng localizacaoDoUsuario,
  double localizacaoMaxima,
) {
  // First create some emptyList
  List<PrestadoresDeServicosRecord> placesList = [];
  List<double> listKm = [];
  double lat1 = localizacaoDoUsuario.latitude;
  double lon1 = localizacaoDoUsuario.longitude;
  // This iterates through the single documents "places" in the List
  for (PrestadoresDeServicosRecord produto in produtos) {
    if (produto.localizacaoDoComerciante != null) {
      double lat2 = produto.localizacaoDoComerciante!.latitude;
      double lon2 = produto.localizacaoDoComerciante!.longitude;
      // Rest of the  calculation logic remains unchanged
      // Ensure to keep the rest of the code intact
      var c = math.cos;
      var p = 0.017453292519943295;
      var a = 0.5 -
          c((lat2 - lat1) * p) / 2 +
          c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
      // This is getting us the distance
      var d = (12742 * math.asin(math.sqrt(a)));
      String inString = d.toStringAsFixed(2); // '2.35'
      double inDouble = double.parse(inString);
      listKm.add(inDouble);
      // Sort the documents that will be returned by distance
      listKm.sort();
      int listKmIndex = listKm.indexWhere((dist) => dist == inDouble);
      // Check if the document we are currently processing is no farther away from userGeo than we defined as max.
      if (inDouble <= localizacaoMaxima) {
        // If its within our radius, add it to the list of places documents that will be returned
        placesList.insert(listKmIndex, produto);
      }
    }
  }

  return placesList;
}

int? quantasVariacoes(List<String>? variacoes) {
  // conte quantas strings tem no list e retorne-o
  if (variacoes != null) {
    return variacoes.length;
  } else {
    return null;
  }
}

bool verifiqueQueExiste(
  String item,
  List<String> items,
) {
  // verifique se item é igual a items se for retorne true
  if (items.contains(item)) {
    return true;
  } else {
    return false;
  }
}

String passouUmMes(
  DateTime diaDoPedido,
  String? qualPlano,
) {
  // caso passe 1 mes mude qualPlano para sem plano e coloque um aviso
  final umMesDepois = diaDoPedido.add(Duration(days: 30));
  if (DateTime.now().isAfter(umMesDepois)) {
    qualPlano = 'sem plano';
    return 'Atenção: Passou um mês desde o pedido, o plano foi alterado para sem plano.';
  }
  return '';
}

int? calcularLojas(
  List<LojistasRecord>? lojistas,
  List<PrestadoresDeServicosRecord>? prestadores,
) {
  // calcule quantos tem em lojistas e prestadores e retorne-os
  int totalLojistas = lojistas?.length ?? 0;
  int totalPrestadores = prestadores?.length ?? 0;

  return totalLojistas + totalPrestadores;
}

String calculeKM(
  LatLng localizacaoDoUsuario,
  LatLng localizacaoDoPrestador,
) {
  // calcule quantos km tem entre localizacaoDoUsuario e localizacaoDoPrestador
  double lat1 = localizacaoDoUsuario.latitude;
  double lon1 = localizacaoDoUsuario.longitude;
  double lat2 = localizacaoDoPrestador.latitude;
  double lon2 = localizacaoDoPrestador.longitude;

  const double pi = 3.1415926535897932;
  const double earthRadius = 6371.0;

  double dLat = (lat2 - lat1) * (pi / 180);
  double dLon = (lon2 - lon1) * (pi / 180);

  double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(lat1 * (pi / 180)) *
          math.cos(lat2 * (pi / 180)) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);
  double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));

  double distance = earthRadius * c;

  return distance.toStringAsFixed(2) + ' km';
}

double calculeEm7Dias(double valores) {
  // calcule os valores e retorne a somatoria em até 7 dias
  double somatoria = 0.0;
  for (int i = 0; i < 7; i++) {
    somatoria += valores;
  }
  return somatoria;
}

double calculeEm30Dias(double valores) {
  // calcule os valores e retorne a somatoria em até 7 dias
  double somatoria = 0.0;
  for (int i = 0; i < 30; i++) {
    somatoria += valores;
  }
  return somatoria;
}

String formatarDoubleparaCNPJ(double cnpj) {
  // formate cnpj para string igual cnpj
  String cnpjString = cnpj.toStringAsFixed(0);
  if (cnpjString.length == 14) {
    return cnpjString.substring(0, 2) +
        '.' +
        cnpjString.substring(2, 5) +
        '.' +
        cnpjString.substring(5, 8) +
        '/' +
        cnpjString.substring(8, 12) +
        '-' +
        cnpjString.substring(12);
  } else {
    return 'Invalid CNPJ';
  }
}

bool itsEqual(
  String valor,
  String valorDaAPI,
) {
  if (valor == valorDaAPI) {
    return true;
  } else {
    return false;
  }
}

String tryhdiasDepois() {
  // 30 dias depois contando de hoje
  DateTime now = DateTime.now();
  DateTime after30Days = now.add(Duration(days: 30));
  return DateFormat('yyyy-MM-dd').format(after30Days);
}

String umDiaDepois() {
  // retorne 1 dia depois contando hoje
  DateTime hoje = DateTime.now();
  DateTime umDiaDepois = hoje.add(Duration(days: 1));
  return DateFormat('yyyy-MM-dd').format(umDiaDepois);
}

List<String> calcularParcelamento(double valor) {
  // calcular o parcelamento do valor em até 12x
  List<String> parcelas = [];
  for (int i = 1; i <= 10; i++) {
    double valorParcela = valor / i;
    parcelas.add('Parcelar ${i}x: R\$ ${valorParcela.toStringAsFixed(2)}');
  }
  return parcelas;
}

double convertStringToDouble(String dropdown) {
  // formate a string para double
  return double.parse(dropdown);
}

double convertaDoubleEmReal(double valorReal) {
  // converta o double na moeda real
  final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
  return double.parse(formatter.format(valorReal).replaceAll(',', '.'));
}

String listString(List<String>? list) {
  // formate a list em string
  if (list == null || list.isEmpty) {
    return '';
  }

  return list.join(', ');
}

int retornCountFavoritos(
  List<String>? favoritos,
  String? favoritouUsuario,
) {
  // calcule quantos usuarios favoritouUsuario na lista favoritos
  if (favoritos == null || favoritouUsuario == null) {
    return 0;
  }

  int count = 0;
  for (String usuario in favoritos) {
    if (usuario == favoritouUsuario) {
      count++;
    }
  }

  return count;
}

bool verifiqueassinatura(
  DateTime? dataDaAssinatura,
  String? periodo,
) {
  // retorne true se dataDeAssinatura nao condiz com o periodo
  if (dataDaAssinatura == null || periodo == null) {
    return true;
  }

  DateTime now = DateTime.now();
  DateTime startDate;
  DateTime endDate;

  switch (periodo) {
    case 'mensal':
      startDate = now.subtract(Duration(days: 30));
      endDate = now;
      break;
    case 'anual':
      startDate = now.subtract(Duration(days: 365));
      endDate = now;
      break;
    default:
      return true;
  }

  return dataDaAssinatura.isBefore(startDate) ||
      dataDaAssinatura.isAfter(endDate);
}

int? visitasNaSemana(
  List<VisitasStruct> dataTypeV,
  String diaDaSemana,
) {
  // busque dentro da variavel dataTypeV a dia e retorne quantos usuarios visitou baseado no dia do dataTypeV e diaDaSemana
  int count = 0;
  for (var visita in dataTypeV) {
    if (visita.dia != null) {
      String formattedDiaDaSemana = DateFormat('EEEE').format(visita.dia!);
      if (formattedDiaDaSemana == diaDaSemana) {
        count++;
      }
    }
  }
  return count;
}

double calculeValorTotal(
  double valor1,
  double valor2,
) {
  // calcule o valor1 com o valor2 e retorne-o
  return valor1 + valor2;
}

String espacoCartoes(String textfield) {
  // quando textfield for focus retorne os espaços de 16 digitos do cartao
  if (textfield.length == 16) {
    return textfield.replaceAllMapped(
        RegExp(r".{4}"), (match) => "${match.group(0)} ");
  } else {
    return '';
  }
}

String retireOsPontos(String text) {
  // Retire os pontos do cpf "., -"
  return text.replaceAll(RegExp(r'[., -]'), '');
}
