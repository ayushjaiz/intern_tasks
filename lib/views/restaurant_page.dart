import 'package:flutter/material.dart';
import 'package:intern_tasks/models/food_item_model.dart';
import 'package:intern_tasks/constants/constants.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  State<Restaurant> createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  List<FoodItem> foodItems = [
    FoodItem(
        cost: 169,
        name: "Farmhouse Pizza",
        description: "Onion, Mushroom, Capsicum & Tomato",
        imageUrl:
            "https://lh3.googleusercontent.com/bbwf5LAF728glL7Bkeyx0S19pZaqvu_yC6AJS8MsFOK7lE_15TZbXYk7lyujI08jHNvE2ZFPk4tTsAqEWfpXCytHBSAVRHob-my1ng8=w512-rw",
        isVeg: true,
        isSpecial: true),
    FoodItem(
        cost: 180,
        name: "Paneer Tikka Pizza",
        description: "Savory fusion: Panner Tikka Pizza blends Indian flavors with cheesy delight",
        imageUrl: "https://cdn.dotpe.in/longtail/store-items/8050593/mOpZvDFu.jpeg",
        isVeg: true,
        isSpecial: false),
    FoodItem(
        cost: 169,
        name: "Tandoori Chicken BBQ Pizza",
        description:
            "A blend of smoky tandoori chicken and tangy BBQ sauce on a crispy pizza crust",
        imageUrl:
            "https://images.slurrp.com/prod/articles/ln83opwfdua.webp?impolicy=slurrp-20210601",
        isVeg: false,
        isSpecial: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppConstants.PRIMARY_COLOR,
        onPressed: () {
          // TODO
          // view full menu
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.menu_book,color: Colors.white)
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Pizza Town', style: TextStyle(color: Colors.white)),
        backgroundColor: AppConstants.PRIMARY_COLOR,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 5),
              color: Colors.orangeAccent[100],
              child:
                  const Center(child: Text("Pizza", style: TextStyle(fontWeight: FontWeight.bold))),
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  return _itemList(foodItems[index]);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _itemList(FoodItem foodItem) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 250,
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
                Text(foodItem.description, style: const TextStyle(fontSize: 13, color: Colors.brown)),
                if (foodItem.isSpecial)
                  Image.asset('images/star.png', width: 25, height: 25, fit: BoxFit.cover),
              ],
            ),
          ),
          SizedBox(
            width: 75,
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10), // Adjust the value as needed
                  child: Image.network(
                    foodItem.imageUrl,
                    height: 75, // Adjust height as needed
                    fit: BoxFit.cover, // Adjust the fit as needed
                  ),
                ),
                OutlinedButton(
                  onPressed: () {
                    // TODO
                    // Add foot item to cart
                  },
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 23),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(5.0), // Adjust the border radius value as needed
                    ),
                  ),
                  child: Text("ADD", style: TextStyle(color: AppConstants.PRIMARY_COLOR)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
