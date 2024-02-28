class FoodItem {
  int cost;
  String name;
  String description;
  String imageUrl;
  bool isSpecial;
  bool isVeg;

  FoodItem(
      {required this.cost,
        required this.name,
        required this.description,
        required this.imageUrl,
        required this.isVeg,
        required this.isSpecial});
}