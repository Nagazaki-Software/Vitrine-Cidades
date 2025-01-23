import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CriarAssinaturaComCartaoDeCreditoCall {
  static Future<ApiCallResponse> call({
    double? value,
    String? nextDueDate = '',
    String? customer = '',
    String? holderName = '',
    String? number = '',
    String? expiryMonth = '',
    String? expiryYear = '',
    String? ccv = '',
    String? remoteIp = '',
    String? description = '',
    int? installmentCount,
    double? installmentValue,
    String? name = '',
    String? email = '',
    String? cpfCnpj = '',
    String? postalCode = '',
    String? addressNumber = '',
    String? addressComplement = '',
    String? phone = '',
  }) async {
    final ffApiRequestBody = '''
{
  "billingType": "CREDIT_CARD",
  "customer": "${escapeStringForJson(customer)}",
  "value": ${value},
  "dueDate": "${escapeStringForJson(nextDueDate)}",
  "remoteIp": "${escapeStringForJson(remoteIp)}",
  "description": "${escapeStringForJson(description)}",
  "installmentCount": ${installmentCount},
  "installmentValue": ${installmentValue},
  "creditCardHolderInfo": {
    "name": "${escapeStringForJson(name)}",
    "email": "${escapeStringForJson(email)}",
    "cpfCnpj": "${escapeStringForJson(cpfCnpj)}",
    "postalCode": "${escapeStringForJson(postalCode)}",
    "addressNumber": "${escapeStringForJson(addressNumber)}",
    "addressComplement":"${escapeStringForJson(addressComplement)}",
    "phone": "${escapeStringForJson(phone)}"
  },
  "creditCard": {
    "holderName": "${escapeStringForJson(holderName)}",
    "number": ${escapeStringForJson(number)},
    "expiryMonth": ${escapeStringForJson(expiryMonth)},
    "expiryYear": ${escapeStringForJson(expiryYear)},
    "ccv": ${escapeStringForJson(ccv)}
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'criarAssinaturaComCartaoDeCredito',
      apiUrl: 'https://api.asaas.com/v3/payments',
      callType: ApiCallType.POST,
      headers: {
        'access_token':
            '\$aact_MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OmVkYjI2ZWFkLTkyMWItNDdkZi05YmJmLTQ1ZWUwOGVkZGVkNTo6JGFhY2hfNmM5MmU0ZDItYjhkMC00NWU5LTg2MzEtODIxMWUxZGIzMjFk',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CriarAssinaturaComPIXCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'criarAssinaturaComPIX',
      apiUrl: 'https://api.asaas.com/v3/paymentLinks/${id}',
      callType: ApiCallType.GET,
      headers: {
        'access_token':
            '\$aact_MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OmVkYjI2ZWFkLTkyMWItNDdkZi05YmJmLTQ1ZWUwOGVkZGVkNTo6JGFhY2hfNmM5MmU0ZDItYjhkMC00NWU5LTg2MzEtODIxMWUxZGIzMjFk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CriarClienteCall {
  static Future<ApiCallResponse> call({
    String? cpfCnpj = '',
    String? email = '',
    String? address = '',
    double? addressNumber,
    String? postalCode = '0',
    String? province = '',
    String? name = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'criarCliente',
      apiUrl: 'https://api.asaas.com/v3/customers',
      callType: ApiCallType.POST,
      headers: {
        'access_token':
            '\$aact_MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OmVkYjI2ZWFkLTkyMWItNDdkZi05YmJmLTQ1ZWUwOGVkZGVkNTo6JGFhY2hfNmM5MmU0ZDItYjhkMC00NWU5LTg2MzEtODIxMWUxZGIzMjFk',
      },
      params: {
        'name': name,
        'cpfCnpj': cpfCnpj,
        'email': email,
        'address': address,
        'addressNumber': addressNumber,
        'province': province,
        'postalCode': postalCode,
      },
      bodyType: BodyType.X_WWW_FORM_URL_ENCODED,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? customerID(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class PuxarCEPCall {
  static Future<ApiCallResponse> call({
    String? cep = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'puxarCEP',
      apiUrl: 'viacep.com.br/ws/${cep}/json',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? rua(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.logradouro''',
      ));
  static String? bairro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.bairro''',
      ));
  static String? localidade(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.localidade''',
      ));
  static String? uf(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.uf''',
      ));
  static String? estado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.estado''',
      ));
}

class GetClienteCall {
  static Future<ApiCallResponse> call({
    String? cpfCnpj = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getCliente',
      apiUrl: 'https://api.asaas.com/v3/customers',
      callType: ApiCallType.GET,
      headers: {
        'access_token':
            '\$aact_MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OmVkYjI2ZWFkLTkyMWItNDdkZi05YmJmLTQ1ZWUwOGVkZGVkNTo6JGFhY2hfNmM5MmU0ZDItYjhkMC00NWU5LTg2MzEtODIxMWUxZGIzMjFk',
      },
      params: {
        'cpfCnpj': cpfCnpj,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? emails(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].email''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static String? idCustomer(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.data[:].id''',
      ));
}

class GetIPCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'getIP',
      apiUrl: 'https://api.country.is/',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class PixRecorrenteCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'pixRecorrente',
      apiUrl: 'https://api.asaas.com/v3/payments/${id}/pixQrCode',
      callType: ApiCallType.GET,
      headers: {
        'access_token':
            '\$aact_MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OmVkYjI2ZWFkLTkyMWItNDdkZi05YmJmLTQ1ZWUwOGVkZGVkNTo6JGFhY2hfNmM5MmU0ZDItYjhkMC00NWU5LTg2MzEtODIxMWUxZGIzMjFk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? image(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.encodedImage''',
      ));
  static String? pixAleatorio(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.payload''',
      ));
  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class AssinaturaPixCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'assinaturaPix',
      apiUrl: 'https://API.asaas.com/v3/payments/${id}',
      callType: ApiCallType.GET,
      headers: {
        'access_token':
            '\$aact_MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OmVkYjI2ZWFkLTkyMWItNDdkZi05YmJmLTQ1ZWUwOGVkZGVkNTo6JGFhY2hfNmM5MmU0ZDItYjhkMC00NWU5LTg2MzEtODIxMWUxZGIzMjFk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? tudo(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class EstornosCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'estornos',
      apiUrl: 'https://api.asaas.com/v3/payments/${id}/refund',
      callType: ApiCallType.POST,
      headers: {
        'access_token':
            '\$aact_MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OmVkYjI2ZWFkLTkyMWItNDdkZi05YmJmLTQ1ZWUwOGVkZGVkNTo6JGFhY2hfNmM5MmU0ZDItYjhkMC00NWU5LTg2MzEtODIxMWUxZGIzMjFk',
      },
      params: {},
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: true,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic? tudo(dynamic response) => getJsonField(
        response,
        r'''$''',
      );
  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class RecuperarStatusCall {
  static Future<ApiCallResponse> call({
    String? id = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'recuperar status',
      apiUrl: 'https://api.asaas.com/v3/payments/${id}/status',
      callType: ApiCallType.GET,
      headers: {
        'access_token':
            '\$aact_MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OmVkYjI2ZWFkLTkyMWItNDdkZi05YmJmLTQ1ZWUwOGVkZGVkNTo6JGFhY2hfNmM5MmU0ZDItYjhkMC00NWU5LTg2MzEtODIxMWUxZGIzMjFk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class ListarTodosPixCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'listarTodosPix',
      apiUrl: 'https://api.asaas.com/v3/pix/transactions',
      callType: ApiCallType.GET,
      headers: {
        'access_token':
            '\$aact_MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OmVkYjI2ZWFkLTkyMWItNDdkZi05YmJmLTQ1ZWUwOGVkZGVkNTo6JGFhY2hfNmM5MmU0ZDItYjhkMC00NWU5LTg2MzEtODIxMWUxZGIzMjFk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? idpix(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].conciliationIdentifier''',
      ));
  static List<String>? id(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].id''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  static List<String>? cpfCnpj(dynamic response) => (getJsonField(
        response,
        r'''$.data[:].externalAccount.cpfCnpj''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class CobrancaPixCall {
  static Future<ApiCallResponse> call({
    String? customer = '',
    String? billingType = '',
    double? value,
    String? dueDate = '',
    String? description = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'cobrancaPix',
      apiUrl: 'https://api.asaas.com/v3/payments',
      callType: ApiCallType.POST,
      headers: {
        'access_token':
            '\$aact_MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OmVkYjI2ZWFkLTkyMWItNDdkZi05YmJmLTQ1ZWUwOGVkZGVkNTo6JGFhY2hfNmM5MmU0ZDItYjhkMC00NWU5LTg2MzEtODIxMWUxZGIzMjFk',
      },
      params: {
        'customer': customer,
        'billingType': billingType,
        'value': value,
        'dueDate': dueDate,
        'description': description,
      },
      bodyType: BodyType.MULTIPART,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? id(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? invoiceUrl(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.invoiceUrl''',
      ));
  static String? invoiceNumber(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.invoiceNumber''',
      ));
}

class ListarCobrancasCall {
  static Future<ApiCallResponse> call({
    String? customer = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'listarCobrancas',
      apiUrl: 'https://api.asaas.com/v3/payments',
      callType: ApiCallType.GET,
      headers: {
        'access_token':
            '\$aact_MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OmVkYjI2ZWFkLTkyMWItNDdkZi05YmJmLTQ1ZWUwOGVkZGVkNTo6JGFhY2hfNmM5MmU0ZDItYjhkMC00NWU5LTg2MzEtODIxMWUxZGIzMjFk',
      },
      params: {
        'customer': customer,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.data[:].status''',
      ));
}

class RecuperarSaldoEmContaCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'recuperarSaldoEmConta',
      apiUrl: 'https://api.asaas.com/v3/finance/balance',
      callType: ApiCallType.GET,
      headers: {
        'access_token':
            '\$aact_MzkwODA2MWY2OGM3MWRlMDU2NWM3MzJlNzZmNGZhZGY6OmVkYjI2ZWFkLTkyMWItNDdkZi05YmJmLTQ1ZWUwOGVkZGVkNTo6JGFhY2hfNmM5MmU0ZDItYjhkMC00NWU5LTg2MzEtODIxMWUxZGIzMjFk',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static double? saldo(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.balance''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
