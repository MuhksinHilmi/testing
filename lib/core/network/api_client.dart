import 'package:http/http.dart' as http;

class ApiClient {
  final String baseUrl;

  ApiClient(this.baseUrl);

  Future<http.Response> get(String endpoint) async {
    return await http.get(Uri.parse('$baseUrl/$endpoint'));
  }

  Future<http.Response> post(String endpoint, {dynamic body}) async {
    return await http.post(
      Uri.parse('$baseUrl/$endpoint'),
      body: body,
      headers: {'Content-Type': 'application/json'},
    );
  }
}
