import 'dart:convert';
import 'api_method.dart';
import 'network_response.dart';
import 'package:http/http.dart' as http;

class NetworkCaller {
  static Future<NetworkResponse> callApi({
    required String url,
    required ApiMethod method,
    Map<String, String>? headers,
    dynamic body,
    bool isJsonRequest = true,
  }) async {
    try {
      final defaultHeaders = <String, String>{};
      if (isJsonRequest) {
        defaultHeaders['Content-Type'] = 'application/json';
      }
      if (headers != null) {
        defaultHeaders.addAll(headers);
      }

      http.Response response;

      switch (method) {
        case ApiMethod.get:
          response = await http.get(Uri.parse(url), headers: defaultHeaders);
          break;
        case ApiMethod.post:
          response = await http.post(
            Uri.parse(url),
            headers: defaultHeaders,
            body: isJsonRequest ? jsonEncode(body) : body,
          );
          break;
        case ApiMethod.put:
          response = await http.put(
            Uri.parse(url),
            headers: defaultHeaders,
            body: isJsonRequest ? jsonEncode(body) : body,
          );
          break;
        case ApiMethod.delete:
          response = await http.delete(Uri.parse(url), headers: defaultHeaders);
          break;
        case ApiMethod.patch:
          response = await http.patch(
            Uri.parse(url),
            headers: defaultHeaders,
            body: isJsonRequest ? jsonEncode(body) : body,
          );
          break;
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = jsonDecode(response.body);
        return NetworkResponse(
          isSuccess: true,
          data: data,
          statusCode: response.statusCode,
        );
      } else {
        return NetworkResponse(
          isSuccess: false,
          statusCode: response.statusCode,
          errorMessage: response.body,
        );
      }
    } catch (e) {
      return NetworkResponse(
        isSuccess: false,
        statusCode: 0,
        errorMessage: e.toString(),
      );
    }
  }
}
