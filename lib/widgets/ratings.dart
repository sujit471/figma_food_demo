import 'package:flutter/material.dart';
import '../Constant/list.dart';
import '../card/imagecard.dart';

class Ratings extends StatelessWidget {
  const Ratings({
    Key? key,
    required this.image,
    required this.name,
    required this.name2,
    required this.description,
    this.showImages = true,
    this.maxImages = 5,
  }) : super(key: key);

  final String? image;
  final String name;
  final String name2;
  final String description;
  final bool showImages;
  final int maxImages;

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 24, 8, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
=======
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
>>>>>>> 202cc522e6643469d0bb9cca307a67de60d62a0a
              ),
              const SizedBox(width: 4),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: -2.0,
                    children: [
                      for (int i = 0; i < 5; i++)
                        const Icon(Icons.star, color: Colors.green),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Text(
                name2,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (showImages)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  for (int index = 0;
                  index < maxImages && index < images.length;
                  index++)
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ImageCard(
                        imageHeight: 88,
                        imageWidth: 88,
                        imagePath: images[index],
                      ),
                    ),
                ],
              ),
            ),
          const SizedBox(height: 12),
          Text(description),
        ],
      ),
    );
  }
}
