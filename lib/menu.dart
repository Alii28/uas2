import 'package:flutter/material.dart';
import 'Topping.dart';
import 'MenuItem.dart';
import 'cart.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Map<String, dynamic>> cart = [];
  int total = 0;

  void addItemToCart(String itemName, int price, List<String> selectedToppings) {
    setState(() {
      cart.add({
        'name': itemName,
        'price': price,
        'toppings': selectedToppings,
      });
      total += price;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<MenuItem> menuItems = [
      MenuItem(
        name: 'Burger',
        price: 10,
        imagePath: 'assets/burger.jpg',
        toppings: [
          Topping(name: 'Cheese', price: 2),
          Topping(name: 'Lettuce', price: 1),
          Topping(name: 'Tomato', price: 1),
          Topping(name: 'Pickles', price: 1),
          Topping(name: 'Onions', price: 1),
          Topping(name: 'Bacon', price: 3),
          Topping(name: 'Avocado', price: 2),
          Topping(name: 'Egg', price: 2),
          Topping(name: 'Mayo', price: 1),
          Topping(name: 'Ketchup', price: 1),
        ],
      ),
      MenuItem(
        name: 'keripik kentang',
        price: 12,
        imagePath: 'assets/keripik_talas.jpeg',
        toppings: [
          Topping(name: 'Cheese', price: 2),
          Topping(name: 'Lettuce', price: 1),
          Topping(name: 'Tomato', price: 1),
          Topping(name: 'Pickles', price: 1),
          Topping(name: 'Onions', price: 1),
          Topping(name: 'Bacon', price: 3),
          Topping(name: 'Avocado', price: 2),
          Topping(name: 'Egg', price: 2),
          Topping(name: 'Mayo', price: 1),
          Topping(name: 'Ketchup', price: 1),
        ],
      ),
      MenuItem(
        name: 'perkedel talas',
        price: 12,
        imagePath: 'assets/perkedel_talas.jpeg',
        toppings: [
          Topping(name: 'Cheese', price: 2),
          Topping(name: 'Lettuce', price: 1),
          Topping(name: 'Tomato', price: 1),
          Topping(name: 'Pickles', price: 1),
          Topping(name: 'Onions', price: 1),
          Topping(name: 'Bacon', price: 3),
          Topping(name: 'Avocado', price: 2),
          Topping(name: 'Egg', price: 2),
          Topping(name: 'Mayo', price: 1),
          Topping(name: 'Ketchup', price: 1),
        ],
      ),
      MenuItem(
        name: 'Pizza',
        price: 12,
        imagePath: 'assets/pizza.jpg',
        toppings: [
          Topping(name: 'Cheese', price: 2),
          Topping(name: 'Lettuce', price: 1),
          Topping(name: 'Tomato', price: 1),
          Topping(name: 'Pickles', price: 1),
          Topping(name: 'Onions', price: 1),
          Topping(name: 'Bacon', price: 3),
          Topping(name: 'Avocado', price: 2),
          Topping(name: 'Egg', price: 2),
          Topping(name: 'Mayo', price: 1),
          Topping(name: 'Ketchup', price: 1),
        ],
      ),
      MenuItem(
        name: 'stick talas',
        price: 8,
        imagePath: 'assets/stick_talas.jpeg',
        toppings: [
          Topping(name: 'Cheese', price: 2),
          Topping(name: 'Lettuce', price: 1),
          Topping(name: 'Tomato', price: 1),
          Topping(name: 'Pickles', price: 1),
          Topping(name: 'Onions', price: 1),
          Topping(name: 'Bacon', price: 3),
          Topping(name: 'Avocado', price: 2),
          Topping(name: 'Egg', price: 2),
          Topping(name: 'Mayo', price: 1),
          Topping(name: 'Ketchup', price: 1),
        ],
      ),
      MenuItem(
        name: 'Kebab',
        price: 8,
        imagePath: 'assets/kebab.jpg',
        toppings: [
          Topping(name: 'Cheese', price: 2),
          Topping(name: 'Lettuce', price: 1),
          Topping(name: 'Tomato', price: 1),
          Topping(name: 'Pickles', price: 1),
          Topping(name: 'Onions', price: 1),
          Topping(name: 'Bacon', price: 3),
          Topping(name: 'Avocado', price: 2),
          Topping(name: 'Egg', price: 2),
          Topping(name: 'Mayo', price: 1),
          Topping(name: 'Ketchup', price: 1),
        ],
      ),
      MenuItem(
        name: 'bakso goreng telur',
        price: 8,
        imagePath: 'assets/bakso goreng telur.jpg',
        toppings: [
          Topping(name: 'Cheese', price: 2),
          Topping(name: 'Lettuce', price: 1),
          Topping(name: 'Tomato', price: 1),
          Topping(name: 'Pickles', price: 1),
          Topping(name: 'Onions', price: 1),
          Topping(name: 'Bacon', price: 3),
          Topping(name: 'Avocado', price: 2),
          Topping(name: 'Egg', price: 2),
          Topping(name: 'Mayo', price: 1),
          Topping(name: 'Ketchup', price: 1),
        ],
      ),
      MenuItem(
        name: 'Mie Ceker',
        price: 7,
        imagePath: 'assets/mie ceker.jpg',
        toppings: [
          Topping(name: 'Cheese', price: 2),
          Topping(name: 'Lettuce', price: 1),
          Topping(name: 'Tomato', price: 1),
          Topping(name: 'Pickles', price: 1),
          Topping(name: 'Onions', price: 1),
          Topping(name: 'Bacon', price: 3),
          Topping(name: 'Avocado', price: 2),
          Topping(name: 'Egg', price: 2),
          Topping(name: 'Mayo', price: 1),
          Topping(name: 'Ketchup', price: 1),
        ],
      ),
      MenuItem(
        name: 'roti omlet',
        price: 7,
        imagePath: 'assets/roti omlet.jpg',
        toppings: [
          Topping(name: 'Cheese', price: 2),
          Topping(name: 'Lettuce', price: 1),
          Topping(name: 'Tomato', price: 1),
          Topping(name: 'Pickles', price: 1),
          Topping(name: 'Onions', price: 1),
          Topping(name: 'Bacon', price: 3),
          Topping(name: 'Avocado', price: 2),
          Topping(name: 'Egg', price: 2),
          Topping(name: 'Mayo', price: 1),
          Topping(name: 'Ketchup', price: 1),
        ],
      ),
      MenuItem(
        name: 'Nugget',
        price: 6,
        imagePath: 'assets/nugget.jpg',
        toppings: [
          Topping(name: 'Cheese', price: 2),
          Topping(name: 'Lettuce', price: 1),
          Topping(name: 'Tomato', price: 1),
          Topping(name: 'Pickles', price: 1),
          Topping(name: 'Onions', price: 1),
          Topping(name: 'Bacon', price: 3),
          Topping(name: 'Avocado', price: 2),
          Topping(name: 'Egg', price: 2),
          Topping(name: 'Mayo', price: 1),
          Topping(name: 'Ketchup', price: 1),
        ],
      ),
      MenuItem(
        name: 'Tahu Gejrot',
        price: 5,
        imagePath: 'assets/tahu gejrot.jpg',
        toppings: [
          Topping(name: 'Cheese', price: 2),
          Topping(name: 'Lettuce', price: 1),
          Topping(name: 'Tomato', price: 1),
          Topping(name: 'Pickles', price: 1),
          Topping(name: 'Onions', price: 1),
          Topping(name: 'Bacon', price: 3),
          Topping(name: 'Avocado', price: 2),
          Topping(name: 'Egg', price: 2),
          Topping(name: 'Mayo', price: 1),
          Topping(name: 'Ketchup', price: 1),
        ],
      ),
      MenuItem(
        name: 'tahu sumedang',
        price: 7,
        imagePath: 'assets/Tahu Sumedang.jpg',
        toppings: [
          Topping(name: 'Cheese', price: 2),
          Topping(name: 'Lettuce', price: 1),
          Topping(name: 'Tomato', price: 1),
          Topping(name: 'Pickles', price: 1),
          Topping(name: 'Onions', price: 1),
          Topping(name: 'Bacon', price: 3),
          Topping(name: 'Avocado', price: 2),
          Topping(name: 'Egg', price: 2),
          Topping(name: 'Mayo', price: 1),
          Topping(name: 'Ketchup', price: 1),
        ],
      ),
      MenuItem(
        name: 'momo',
        price: 7,
        imagePath: 'assets/momo.jpg',
        toppings: [
          Topping(name: 'Cheese', price: 2),
          Topping(name: 'Lettuce', price: 1),
          Topping(name: 'Tomato', price: 1),
          Topping(name: 'Pickles', price: 1),
          Topping(name: 'Onions', price: 1),
          Topping(name: 'Bacon', price: 3),
          Topping(name: 'Avocado', price: 2),
          Topping(name: 'Egg', price: 2),
          Topping(name: 'Mayo', price: 1),
          Topping(name: 'Ketchup', price: 1),
        ],
      ),
      MenuItem(
        name: 'Kroket Talas',
        price: 5,
        imagePath: 'assets/kroket_talas.jpeg',
        toppings: [
          Topping(name: 'Cheese', price: 2),
          Topping(name: 'Lettuce', price: 1),
          Topping(name: 'Tomato', price: 1),
          Topping(name: 'Pickles', price: 1),
          Topping(name: 'Onions', price: 1),
          Topping(name: 'Bacon', price: 3),
          Topping(name: 'Avocado', price: 2),
          Topping(name: 'Egg', price: 2),
          Topping(name: 'Mayo', price: 1),
          Topping(name: 'Ketchup', price: 1),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Menu'),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          return menuItemWidget(menuItems[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(cart: cart, total: total),
            ),
          );
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }

  Widget menuItemWidget(MenuItem menuItem) {
    return ListTile(
      leading: Image.asset(
        menuItem.imagePath,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      ),
      title: Text('${menuItem.name} - \$${menuItem.price}'),
      trailing: IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          showToppingDialog(menuItem);
        },
      ),
    );
  }

  void showToppingDialog(MenuItem menuItem) {
    List<String> selectedToppings = [];
    int totalPrice = menuItem.price;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text("Add Toppings for ${menuItem.name}"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: menuItem.toppings.map((topping) {
                  return CheckboxListTile(
                    title: Text("${topping.name} (+\$${topping.price})"),
                    value: selectedToppings.contains(topping.name),
                    onChanged: (value) {
                      setDialogState(() {
                        if (value!) {
                          selectedToppings.add(topping.name);
                          totalPrice += topping.price;
                        } else {
                          selectedToppings.remove(topping.name);
                          totalPrice -= topping.price;
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    addItemToCart(menuItem.name, totalPrice, selectedToppings);
                    Navigator.pop(context);
                  },
                  child: Text("Add to Cart (\$${totalPrice})"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
