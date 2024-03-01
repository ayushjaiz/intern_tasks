import 'package:flutter/material.dart';
import 'package:intern_tasks/data/dummy_data.dart' as dummy_data;
import 'package:intern_tasks/constants/constants.dart';
import 'package:intern_tasks/models/food_item_model.dart';

class Restaurant extends StatelessWidget {
  final List<FoodItem> foodItems = dummy_data.foodItems;

  Restaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppConstants.PRIMARY_COLOR,
          onPressed: () {
            // TODO
            // view full menu
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.menu_book, color: Colors.white)),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pizza Town', style: TextStyle(color: Colors.white)),
        backgroundColor: AppConstants.PRIMARY_COLOR,
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            color: Colors.orangeAccent[100],
            child:
                const Center(child: Text("Pizza", style: TextStyle(fontWeight: FontWeight.bold))),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            margin: const EdgeInsets.only(top: 40),
            child: ListView.builder(
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                return _itemList(foodItems[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _itemList(FoodItem foodItem) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(foodItem.isVeg ? 'images/veg.png' : 'images/non-veg.png',
                        width: 20, height: 20, fit: BoxFit.cover),
                    Text("  ₹${foodItem.cost}", style: const TextStyle(fontSize: 15)),
                  ],
                ),
                Text(foodItem.name, style: const TextStyle(fontSize: 15)),
                Text(foodItem.description,
                    style: const TextStyle(fontSize: 12, color: Colors.brown)),
                if (foodItem.isSpecial)
                  Image.asset('images/star.png', width: 25, height: 25, fit: BoxFit.cover),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: 75,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(foodItem.imageUrl, width: 75, height: 75, fit: BoxFit.cover),
                ),
                SizedBox(
                  width: 75,
                  child: OutlinedButton(
                    onPressed: () {
                      // TODO
                      // Add food item to cart
                    },
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                    ),
                    child: Text("ADD", style: TextStyle(color: AppConstants.PRIMARY_COLOR)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
