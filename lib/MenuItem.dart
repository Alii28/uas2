import 'Topping.dart';

class MenuItem {
  final String name;
  final int price;
  final String imagePath;
  final List<Topping> toppings;

  MenuItem({
    required this.name,
    required this.price,
    required this.imagePath,
    this.toppings = const [],
  });
}
