import 'dart:convert';
import 'package:chatsapp/core/utils/auth.dart';
import 'package:http/http.dart' as http;

Future<Map<String, String>> buildHeaders() async {
  final user = await getUser();

  final headers = <String, String>{'Content-Type': 'application/json'};

  if (user != null && user.accessToken.isNotEmpty) {
    headers['Authorization'] = 'Bearer ${user.accessToken}';
  }

  return headers;
}

Future<http.Response> sendRequest(
  String url, {
  String method = 'GET',
  Map<String, dynamic>? body,
}) async {
  final headers = await buildHeaders();
  final uri = Uri.parse(url);

  late final http.Response response;

  switch (method.toUpperCase()) {
    case 'POST':
      response = await http.post(
        uri,
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      break;
    case 'PUT':
      response = await http.put(
        uri,
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );
      break;
    case 'DELETE':
      response = await http.delete(uri, headers: headers);
      break;
    default: // GET
      response = await http.get(uri, headers: headers);
  }

  checkResponseException(response);
  return response;
}

void checkResponseException(http.Response response) {
  if (response.statusCode >= 400) {
    throw Exception('HTTP ${response.statusCode}: ${response.body}');
  }
}
