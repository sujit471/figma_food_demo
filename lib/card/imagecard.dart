import 'package:flutter/material.dart';

import '../Constant/list.dart';
import '../Screens/detailspage.dart';

class ImageCard extends StatelessWidget {
  final String? imagePath;
  final String? tag;
  final Color? tagColor;
  final String? name;
  final double imageWidth;
  final double imageHeight;
  final String? price;
<<<<<<< HEAD
  final bool showRating;
  final double? space;

  final String? linecut;
=======
  final bool showRating; 
>>>>>>> 202cc522e6643469d0bb9cca307a67de60d62a0a

  ImageCard({
    required this.imagePath,
    this.tag,
    this.tagColor,
    this.name,
    this.imageWidth = 300,
    this.imageHeight = 400,
    this.price,
    this.showRating = false,
    this.space,
    this.linecut,
  });

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    int index = 0;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detailspage(
              imagePath: imagePath!,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
        ),

        // Fixed width
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: imageWidth,
                  height: imageHeight,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath!),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(8),
=======
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8)
      ),
      width: 150, // Fixed width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
          Stack(
            children: [
              Container(
                width: imageWidth, 
                height: imageHeight, 
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
>>>>>>> 202cc522e6643469d0bb9cca307a67de60d62a0a
                  ),
                ),
                if (tag != null)
                  Positioned(
                    bottom: 0,
                    left: 1,
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: tagColor ?? Colors.black54,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        tag!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            if (name != null) ...[
              const SizedBox(height: 8),
              Text(
                name!,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 2,
              ),
            ], // Rating (conditionally display if showRating is true)
            if (showRating) ...[
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (int i = 0; i < 5; i++)
                    Icon(
                      i < 4 ? Icons.star : Icons.star_half,
                      size: 16,
                      color: i < 4 ? Colors.green : Colors.green.withOpacity(0.5),
                    ),
                  SizedBox(width: 9,),
                  Text("(65)"),
                ],
              ),
            ],
<<<<<<< HEAD
=======
          ),
          if (name != null) ...[
            SizedBox(height: 8),
            Text(
              name!,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
          if (showRating) ...[
            SizedBox(height: 8),
>>>>>>> 202cc522e6643469d0bb9cca307a67de60d62a0a
            Row(
              children: [
                if (price != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    price!,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(179, 241, 191, 1),
                    ),
                  ),
                ],
                const SizedBox(width:14 ,),
                if (linecut != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    linecut!,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 13,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.bold,
                      color:Colors.grey,
                    ),
                  ),
                ],
              ],
            ),
          ],
<<<<<<< HEAD
        ),
=======
      
          if (price != null) ...[
            SizedBox(height: 8),
            Text(
              price!,
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(179, 241, 191, 1),
              ),
            ),
          ],
        ],
>>>>>>> 202cc522e6643469d0bb9cca307a67de60d62a0a
      ),
    );
  }
}
