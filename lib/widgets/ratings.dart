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
              width: 30.0, // Adjust as needed
              height: 40.0, // Adjust as needed
              child: ClipOval(
                child: Image.asset(
                  image!, // Replace with your image asset
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
                  // Align children starting from the left
                  spacing: -2.0,
                  // Negative spacing to overlap icons
                  children: [
                    // Loop to generate full stars
                    for (int i = 0; i < 5; i++)
                      Icon(Icons.star, color: Colors.green),
                  ],
                ),
              ],
            ),
            Spacer(), // This will push the next text to the rightmost
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
