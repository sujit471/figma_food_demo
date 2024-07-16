import 'dart:ui';

import 'package:flutter/material.dart';

import '../List/list.dart';
import '../card/imagecard.dart';
import '../widgets/ratings.dart';
import '../widgets/row.dart';

class Detailspage extends StatefulWidget {
  const Detailspage({Key? key}) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  @override
  int count = 1 ;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product details"),
        actions: [
          Icon(Icons.message),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
            children: [
              Image.asset(
                'images/food1.jpg',
              ),
              SizedBox(
                height: 12,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    for (int index = 0; index < images.length; index++)
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(

                          decoration: BoxDecoration(

                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),

                          ),
                          child: ImageCard(
                            imageHeight: 100,
                            imagePath: images[0],
                            //name: names[index],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
                children: [
                  const Text("Ekaa Kombuchaa - fressa - 300ml",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ItemsinRow(name: "Rs250", name2: ""),
                      Wrap(
                        alignment: WrapAlignment.start,
                        // Align children starting from the left
                        spacing: -2.0,
                        // Negative spacing to overlap icons
                        children: [
                          // Loop to generate full stars
                          for (int i = 0; i < 4; i++)
                            Icon(Icons.star, color: Colors.green),

                          // Conditionally add a half star if needed
                          if (4.5 % 1 != 0)
                            Icon(Icons.star_half, color: Colors.green),
                        ],
                      ),
                      Text("(65)"),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ItemsinRow(name: "Variations", name2: "Strawberry,300ml  > "),
                  SizedBox(height: 12,),
                  const Text(
                      "Kombucha  General Health benefits s. probitosocs for guthealt, prebitiosc sds fedesdsd ascsds health is "
                          "and iorersdsdcsdcssd as it ht ei name o tdees"),
                  SizedBox(height: 12,),
                ],
              ),
              const Text("Recommended For you",style: TextStyle(fontSize: 24,color: Colors.green,fontWeight: FontWeight.bold),),
              SizedBox(
                height: 15,
              ),
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
                            showRating: true,
                            price: "Rs 250"),
                      ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
                children: [
                  const Text("Review & ratings",style: TextStyle(fontWeight:FontWeight.w100,fontSize: 16, ),),
                  SizedBox(height: 8,),
                  Row(
                    children: [
                      Text("4.4",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(width: 6,),
                      Wrap(
                        alignment: WrapAlignment.start,
                        // Align children starting from the left
                        spacing: -2.0,
                        // Negative spacing to overlap icons
                        children: [
                          // Loop to generate full stars
                          for (int i = 0; i < 4; i++)
                            Icon(Icons.star, color: Colors.green),

                          // Conditionally add a half star if needed
                          if (4.5 % 1 != 0)
                            Icon(Icons.star_half, color: Colors.green),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  const Text("Based on 65 Ratings"),
                  SizedBox(height: 15,),
                  Ratings(image: 'images/food1.jpg', name: "Wade waren", name2: "2h ago", description: "this is an amaizing food review form yhe stroerere with the top notch faclitiss highly recommended"),
                  SizedBox(height: 20,),
                  Ratings(image: "images/food2.jpg", name: "Theresa Webb", name2: "2d ago", description: "Top notch service provided "),
                  SizedBox(height: 20,),
                  Ratings(image:"images/food3.jpg", name:"Cameroon williamson", name2: "3m Ago", description: "higly recommended to go to eat from this place and food is great"),
                  SizedBox(height: 20,),
                  Center(child: Text("View all reviews",style: TextStyle(color: Colors.green),)),
                  SizedBox(height: 10,),
                  Row(
                    children: [Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (count > 1) count--;
                            });
                          },
                          icon: Icon(Icons.remove, color: Colors.green),
                        ),
                        Text(
                          '$count',
                          style: TextStyle(fontSize: 18),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              count++;
                            });
                          },
                          icon: Icon(Icons.add, color: Colors.green),
                        ),
                      ],
                    ),
                      Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Add to cart functionality
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Background color
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Padding inside button
                          textStyle: TextStyle(fontSize: 16),
                        ),
                        icon: Icon(Icons.shopping_bag, color: Colors.white),
                        label: Text('Add to cart',style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),


                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
