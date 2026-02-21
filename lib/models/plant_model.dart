class PlantModel {
  final int? id;
  final String? name;
  final String? description;
  final String? light;
  final String? water;
  final String? difficulty;
  final String? image;
  final double? price;

  PlantModel({this.description,this.id,this.image,this.light,this.name,this.water,this.price, this.difficulty});

  factory PlantModel.fromJson(Map<String,dynamic> jason){
    return PlantModel(
      id: jason["id"],
      name: jason["name"],
      description: jason["description"],
      light: jason["light"],
      water: jason["water"],
      difficulty: jason["difficulty"],
      image: jason["image"],
      price: jason["price"],
    );
  }
}