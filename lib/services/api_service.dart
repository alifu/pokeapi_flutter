import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokeapi_flutter/models/pokedex.dart';
import 'package:pokeapi_flutter/models/pokemon.dart';

class ApiService {
  static const baseUrl = 'https://pokeapi.co/api/v2';

  /// Fetch paginated list of pokemons
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

  /// Fetch a single Pokémon's detail + species
  Future<Pokemon> fetchPokemon(String name) async {
    // 1. Detail
    final detailUrl = Uri.parse("$baseUrl/pokemon/$name");
    final detailRes = await http.get(detailUrl);
    if (detailRes.statusCode != 200) {
      throw Exception("Failed to load detail");
    }
    final detailData = json.decode(detailRes.body);

    // 2. Species
    final speciesUrl = Uri.parse("$baseUrl/pokemon-species/$name");
    final speciesRes = await http.get(speciesUrl);
    if (speciesRes.statusCode != 200) {
      throw Exception("Failed to load species");
    }
    final speciesData = json.decode(speciesRes.body);

    // Extract English flavor text
    String? description;
    final flavorTexts = speciesData["flavor_text_entries"] as List;
    final englishFlavor = flavorTexts.firstWhere(
          (f) => f["language"]["name"] == "en",
      orElse: () => null,
    );
    if (englishFlavor != null) {
      description = englishFlavor["flavor_text"];
    }

    return Pokemon.fromJson(detailData, description);
  }

  int _extractIdFromUrl(String url) {
    final segments = url.split('/');
    return int.parse(segments[segments.length - 2]);
  }
}
