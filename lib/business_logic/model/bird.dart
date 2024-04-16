
class Bird {
  final int id; // Unique identifier for the bird
  final String name; // Common name of the bird
  final String species; // Scientific name of the bird species
  final String family; // Family to which the bird belongs
  final String habitat; // Habitat where the bird is commonly found
  final String
      placeOfFound; // Geographic location where the bird is commonly found
  final String diet; // Type of diet of the bird
  final String description; // Description or characteristics of the bird
  final String image; // URL of an image representing the bird

  // Constructor to create a Bird object from a JSON map.
  Bird.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        name = json['name'].toString(),
        species = json['species'].toString(),
        family = json['family'].toString(),
        habitat = json['habitat'].toString(),
        placeOfFound = json['place_of_found'].toString(),
        diet = json['diet'].toString(),
        description = json['description'].toString(),
        image = json['image'].toString();
}
