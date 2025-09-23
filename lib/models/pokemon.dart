class Pokemon {
  final int id;
  final String name;
  final String imageUrl;
  final int height;
  final int weight;
  final List<String> types;
  final List<Stat> stats;
  final List<String> abilities;
  final String? description;

  Pokemon({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.height,
    required this.weight,
    required this.types,
    required this.stats,
    required this.abilities,
    this.description,
  });

  factory Pokemon.fromJson(Map<String, dynamic> detailData, String? description) {
    return Pokemon(
      id: detailData["id"],
      name: detailData["name"],
      imageUrl: detailData["sprites"]["other"]["official-artwork"]["front_default"],
      height: detailData["height"],
      weight: detailData["weight"],
      types: (detailData["types"] as List)
          .map((t) => t["type"]["name"].toString())
          .toList(),
      stats: (detailData["stats"] as List)
          .map((s) => Stat.fromJson(s))
          .toList(),
      abilities: (detailData["abilities"] as List)
          .map((a) => a["ability"]["name"].toString())
          .toList(),
      description: description,
    );
  }
}

class Stat {
  final String name;
  final int baseStat;
  final String url;

  Stat({
    required this.name,
    required this.baseStat,
    required this.url,
  });

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
      name: json["stat"]["name"],
      baseStat: json["base_stat"],
      url: json["stat"]["url"],
    );
  }

  String get displayName {
    switch (name.toLowerCase()) {
      case "hp":
        return "HP";
      case "attack":
        return "ATK";
      case "defense":
        return "DEF";
      case "special-attack":
        return "SATK";
      case "special-defense":
        return "SDEF";
      case "speed":
        return "SPD";
      default:
        return "-";
    }
  }
}

