import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imagePath;
  final String? tag;
  final Color? tagColor;
  final String? name;
  final double imageWidth;
  final double imageHeight;
  final String? price;
  final bool showRating; // Boolean to control whether to show the rating or not

  // Constructor
  ImageCard({
    required this.imagePath,
    this.tag,
    this.tagColor,
    this.name,
    this.imageWidth = 150,
    this.imageHeight = 200,
    this.price,
    this.showRating = false, // Default value to hide the rating
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8)
      ),
      width: 150, // Fixed width
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image with optional tag
          Stack(
            children: [
              Container(
                width: imageWidth, // Adjust the width as needed
                height: imageHeight, // Adjust the height as needed
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              // Tag
              if (tag != null)
                Positioned(
                  bottom: 0,
                  left: 1,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: tagColor ?? Colors.black54,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      tag!,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (name != null) ...[
            SizedBox(height: 8),
            Text(
              name!,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],// Rating (conditionally display if showRating is true)
          if (showRating) ...[
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 5; i++)
                  Icon(
                    i < 4 ? Icons.star : Icons.star_half,
                    size: 16,
                    color: i < 4 ? Colors.green : Colors.green.withOpacity(0.5),
                  ),
              ],
            ),
          ],
          // Name (conditionally display)

          // Price (conditionally display)
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
      ),
    );
  }
}
