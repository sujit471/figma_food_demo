import 'package:flutter/material.dart';

import '../List/list.dart';
import '../card/imagecard.dart';

class Ratings extends StatelessWidget {
  const Ratings(
      {Key? key,
        required this.image,
        required this.name,
        required this.name2,
        required this.description})
      : super(key: key);
  final String? image;
  final String name;
  final String name2;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              width: 30.0, 
              height: 40.0,
              child: ClipOval(
                child: Image.asset(
                  image!, 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                 
                  spacing: -2.0,
                
                  children: [
                   
                    for (int i = 0; i < 5; i++)
                      Icon(Icons.star, color: Colors.green),
                  ],
                ),
              ],
            ),
            Spacer(),
            Text(
              name2,
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (int index = 0; index < images.length; index++)
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ImageCard(
                    imageHeight: 100,
                    imagePath: images[index],
                    //name: names[index],
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Text(description),
      ],
    );
  }
}
