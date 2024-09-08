import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {

  final List<Map<String, String>> products = [
    {
      'name': 'Cheese Burger',
      'description': 'D-cheese Burger',
      'image': 'assets/images/qq.jpg',
      'rating': '4.1'
    },
    {
      'name': 'Veggie Burger',
      'description': 'Veggie Delight',
      'image': 'assets/images/ggg.jpg',
      'rating': '4.2'
    },
    {
      'name': 'Chicken Burger',
      'description': 'Grilled Chicken',
      'image': 'assets/images/hhh.jpg',
      'rating': '4.3'
    },
    {
      'name': 'Fish Burger',
      'description': 'Fresh Fish Burger',
      'image': 'assets/images/jjj.jpg',
      'rating': '4.4'
    },
    {
      'name': 'Fish Burger',
      'description': 'Fresh Fish Burger',
      'image': 'assets/images/ww.jpg',
      'rating': '4.5'
    },
    {
    'name': 'Fish Burger',
    'description': 'Fresh Fish Burger',
    'image': 'assets/images/eee.jpg',
    'rating': '4.6'
    },
{
'name': 'Fish Burger',
'description': 'Fresh Fish Burger',
'image': 'assets/images/rrr.jpg',
'rating': '4.7'
},
{
'name': 'Fish Burger',
'description': 'Fresh Fish Burger',
'image': 'assets/images/cc.jpg',
'rating': '4.8'
},
{
'name': 'Fish Burger',
'description': 'Fresh Fish Burger',
'image': 'assets/images/vvv.jpg',
'rating': '4.9'
},
{
'name': 'Fish Burger',
'description': 'Fresh Fish Burger',
'image': 'assets/images/bb.jpg',
'rating': '5.0'
},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8F0D8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'BiteBliss',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Order your favourite food!',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(height: 16),


            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 16),


            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryButton('All', true),
                  _buildCategoryButton('Burger', false),
                  _buildCategoryButton('Potatoes', false),
                ],
              ),
            ),
            SizedBox(height: 16),


            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16.0,
                  crossAxisSpacing: 16.0,
                  childAspectRatio: 3 / 4,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return _buildProductCard(
                    name: product['name']!,
                    description: product['description']!,
                    image: product['image']!,
                    rating: product['rating']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'shopping'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'person'),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String title, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: isSelected ? Colors.lightGreen : Colors.white,
          onPrimary: isSelected ? Colors.white : Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(title),
      ),
    );
  }

  Widget _buildProductCard({
    required String name,
    required String description,
    required String image,
    required String rating,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(description, style: TextStyle(color: Colors.grey)),
                SizedBox(height: 4),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orange, size: 16),
                    SizedBox(width: 4),
                    Text(rating),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
