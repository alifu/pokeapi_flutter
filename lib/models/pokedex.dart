class Pokedex {
  final int id;
  final String name;
  final String imageUrl;

  Pokedex({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  factory Pokedex.fromJson(Map<String, dynamic> json, int id) {
    return Pokedex(
      id: id,
      name: json['name'],
      imageUrl: 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/$id.png',
    );
  }
}