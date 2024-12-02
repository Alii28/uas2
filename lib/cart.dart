import 'package:flutter/material.dart';
import 'payment.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, dynamic>> cart;
  final int total;

  CartPage({required this.cart, required this.total});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late List<Map<String, dynamic>> cart;
  late int total;

  @override
  void initState() {
    super.initState();
    cart = List.from(widget.cart);
    total = widget.total;
  }

  void removeItemFromCart(int index) {
    setState(() {
      total -= cart[index]['price'] as int;
      cart.removeAt(index);
      widget.cart.removeAt(index);
    });
  }

  void editItemToppings(int index) {
    // Ambil data topping yang tersedia
    List<Map<String, dynamic>> itemToppings = availableToppings;

    // Salin data topping yang sudah dipilih
    List<String> selectedToppings = List.from(cart[index]['toppings']);

    // Hitung harga dasar item (tanpa topping)
    int itemBasePrice = cart[index]['price'] -
        selectedToppings.fold<int>(
          0,
              (sum, topping) =>
          sum +
              (itemToppings
                  .firstWhere((t) => t['name'] == topping)['price'] as int),
        );

    // Mulai dengan harga total item saat ini
    int itemTotalPrice = cart[index]['price'];

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setDialogState) {
            return AlertDialog(
              title: Text("Edit Toppings"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: itemToppings.map((topping) {
                  return CheckboxListTile(
                    title: Text("${topping['name']} (+\$${topping['price']})"),
                    value: selectedToppings.contains(topping['name']),
                    onChanged: (value) {
                      setDialogState(() {
                        if (value!) {
                          // Tambahkan topping jika dipilih
                          selectedToppings.add(topping['name']);
                          itemTotalPrice += topping['price'] as int;
                        } else {
                          // Hapus topping jika tidak dipilih
                          selectedToppings.remove(topping['name']);
                          itemTotalPrice -= topping['price'] as int;
                        }
                      });
                    },
                  );
                }).toList(),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Tutup dialog tanpa perubahan
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      // Simpan perubahan topping
                      cart[index]['toppings'] = selectedToppings;

                      // Perbarui harga item berdasarkan topping baru
                      cart[index]['price'] =
                          itemBasePrice + selectedToppings.fold<int>(
                            0,
                                (sum, topping) =>
                            sum +
                                (itemToppings
                                    .firstWhere(
                                        (t) => t['name'] == topping)['price']
                                as int),
                          );

                      // Hitung ulang total harga keranjang
                      total = cart.fold<int>(
                        0,
                            (sum, item) => sum + (item['price'] as int),
                      );
                    });
                    Navigator.pop(context); // Tutup dialog
                  },
                  child: Text("Save (\$${itemTotalPrice})"),
                ),
              ],
            );
          },
        );
      },
    );
  }


  final List<Map<String, dynamic>> availableToppings = [
    {"name": "Cheese", "price": 2},
    {"name": "Lettuce", "price": 1},
    {"name": "Tomato", "price": 1},
    {"name": "Pickles", "price": 1},
    {"name": "Onions", "price": 1},
    {"name": "Bacon", "price": 3},
    {"name": "Avocado", "price": 2},
    {"name": "Egg", "price": 2},
    {"name": "Mayo", "price": 1},
    {"name": "Ketchup", "price": 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return Card(
                  child: ListTile(
                    title: Text(item['name']),
                    subtitle: Text(
                      item['toppings'].isNotEmpty
                          ? "Toppings: ${item['toppings'].join(', ')}"
                          : "No toppings",
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => editItemToppings(index),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => removeItemFromCart(index),
                        ),
                        Text("\$${item['price']}"),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Total: \$${total.toString()}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.end,
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: cart.isEmpty
                      ? null
                      : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(total: total),
                      ),
                    );
                  },
                  child: Text('Proceed to Payment'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
