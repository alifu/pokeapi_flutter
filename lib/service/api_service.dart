import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pokedex.dart';

class ApiService {
  static const baseUrl = 'https://pokeapi.co/api/v2';

  Future<List<Pokedex>> fetchPokedex({
    int limit = 20,
    int offset = 0,
  }) async {
    final url = Uri.parse('$baseUrl/pokemon?limit=$limit&offset=$offset');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List results = data['results'];
      return results.asMap().entries.map((entry) {
        final index = entry.key;
        final item = entry.value;
        final name = item['name'];
        final url = item['url'];
        final id = _extractIdFromUrl(url);
        return Pokedex.fromJson({'name': name}, id);
      }).toList();
    } else {
      throw Exception('Failed to load Pokemon list');
    }
  }

  int _extractIdFromUrl(String url) {
    final segments = url.split('/');
    return int.parse(segments[segments.length - 2]);
  }
}
