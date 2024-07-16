import 'package:figma_food_app/Screens/detailspage.dart';
import 'package:flutter/material.dart';
import '../card/imagecard.dart';
import 'package:figma_food_app/List/list.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    HomeScreen(),
    Detailspage(),
    HomeScreen(),
    Detailspage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });


    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Detailspage()),
      );
    } else if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10), // Spacer for padding
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(179, 241, 191, 1),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.search),
                      hintText: 'Search foods or items',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onChanged: (value) {
                      // Implement search functionality here
                    },
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Image.asset('images/food1.jpg',),
              SizedBox(height: 10), // Spacer for padding
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text("See all"),
                ],
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int index = 0; index < images.length; index++)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ImageCard(
                          imagePath: images[index],
                          name: names[index],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Deals',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text("See all"),
                ],
              ),
              SizedBox(height: 16),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int index = 0; index < images.length; index++)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: ImageCard(
                          imagePath: images[index],
                          name: deals[index],
                          price: 'Rs 250',
                        ),
                      ),
                  ],
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Deals',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text("See all"),
                ],
              ),
              SizedBox(height: 16),
              // Wrap GridView.builder in an Expanded widget
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 0.75, // Adjust as needed
                ),
                itemCount: deals.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImageCard(
                      imageHeight: 120,
                      imageWidth: 200,
                      imagePath: images[index % images.length], // Use modulo to loop images
                      name: deals[index],
                      price: 'Rs250',
                      tag: '20% off',
                      tagColor: Colors.grey,
                      showRating: true,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.fromRGBO(179, 241, 191, 1),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        showSelectedLabels: true, // Show labels for selected items
        showUnselectedLabels: true, // Show labels for unselected items
        selectedItemColor: Colors.green, // Color of selected item
        unselectedItemColor: Colors.green.withOpacity(0.5), // Color of unselected items
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
