import 'package:test_provider/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:io';

const _baseUrl = 'https://jsonplaceholder.typicode.com';

class ApiService {
  Future<List<Users>?> fetchHero() async {
    final response = await http.get(Uri.parse('$_baseUrl/users'));
    var jsonResponse = convert.jsonDecode(response.body) as List;
    if (response.statusCode == 200) {
      return jsonResponse.map((e) => Users.fromJson(e)).toList();
    }
    if (response.statusCode == 404) {
      return throw HttpStatus.notFound;
    }
    return null;
  }
}
