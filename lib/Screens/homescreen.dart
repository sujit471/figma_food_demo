import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../card/imagecard.dart';
import 'package:figma_food_app/Constant/list.dart';
import 'package:flutter_svg/flutter_svg.dart';



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  int _selectedIndex = 0;
  bool selected = false;
  final ScrollController _scrollController = ScrollController();

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 5; i++) {
      final currentIndex = _currentPage == i;
      indicators.add(
        AnimatedContainer(
          duration: Duration(milliseconds: 250),
          width: _currentPage == i ? 40.0 : 10.0,
          height: _currentPage == i ? 20.0 : 8.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? Colors.green : Colors.white,
          ),
          curve: Curves.fastOutSlowIn,
        ),
      );
    }
    return indicators;
  }

  static List<Widget> _pages = <Widget>[
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
        selected = !selected;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 1) {
      // Navigate to the Category screen or perform any action
    } else if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
          child: Container(
            height: 56,
            width: 380,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(236, 246, 238, 1),
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
            child: TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Search foods or items',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onChanged: (value) {},
            ),
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 5,
                      onPageChanged: (index) {
                        log("$index");
                      },
                      itemBuilder: (context, index) {
                        return ImageCard(
                          imageHeight: 200,
                          imageWidth: 380,
                          imagePath: images[index],
                        );
                      },
                    ),
                  ),
                  Positioned(
                    left: 100,
                    bottom: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                const SizedBox(
                  height: 34,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Categories',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                        Text("See all"),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 6),
                        for (int index = 0; index < images.length; index++)
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: ImageCard(
                              imageHeight: 64,
                              imageWidth: 64,
                              imagePath: images[index],
                              name: names[index],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '* Deals',
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text("See all"),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 24),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 8),
                        for (int index = 0; index < images.length; index++)
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: ImageCard(
                                tag: index == 1 ? null : '20% off',
                                tagColor: index == 1 ? null : Colors.grey,
                                linecut: 'Rs250',
                                imageWidth: 168,
                                imageHeight: 192,
                                imagePath: images[index],
                                name: deals[index],
                                price: 'Rs 250',
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '* Recommendation',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                  ),
                  Text("See all"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    mainAxisExtent: MediaQuery.sizeOf(context).width * .75,
                  ),
                  itemCount: deals.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: ImageCard(
                        imageWidth: 182,
                        imageHeight: 192,
                        imagePath: images[index % images.length], // Use modulo to loop images
                        name: deals[index],
                        price: 'Rs250',
                        tag: '20% off',
                        linecut: 'Rs250',
                        tagColor: Colors.grey,
                        showRating: true,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(236, 246, 238, 1),
        onPressed: () {},
        child: SvgPicture.asset('icon/bag.svg', height: 32, width: 32),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: Theme(
        data: ThemeData(
          canvasColor: const Color.fromRGBO(236, 246, 238, 1),
        ),
        child: Container(
          width: 93,
          height: 80,
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: BuildBottomNavItem('icon/home-smile.svg', 0),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: BuildBottomNavItem('icon/menu.svg', 1),
                label: 'Category',
              ),
              BottomNavigationBarItem(
                icon: BuildBottomNavItem('icon/notification.svg', 2),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: BuildBottomNavItem('icon/profile.svg', 3),
                label: 'Profile',
              ),
            ],
            showSelectedLabels: true, // Show labels for selected items
            showUnselectedLabels: true, // Show labels for unselected items
            selectedItemColor: Colors.black, // Color of selected item
            unselectedItemColor: Colors.black.withOpacity(0.5),
            selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
            unselectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black),
            backgroundColor: Colors.white, // Color of unselected items
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }

  Widget BuildBottomNavItem(String assetName, int index) {
    bool isSelected = _selectedIndex == index;
    return Container(
     width: 90,

      decoration: isSelected
          ?  BoxDecoration(
        borderRadius: BorderRadius.circular(16),
       color :Color.fromRGBO(200, 227, 176,1),
        
      )
          : null,
      padding: EdgeInsets.all(isSelected ? 8.0 : 0),
      child: SvgPicture.asset(
        assetName,
        height: 32,
        width: 32,
        color: isSelected ? Colors.black : Colors.black,
      ),
    );
  }
}
