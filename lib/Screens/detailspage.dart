import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../Addtocarbottomsheet/bottom_sheet.dart';
import '../Constant/list.dart';
import '../card/imagecard.dart';
import '../provider/card_provider.dart';
import '../widgets/ratings.dart';
import '../widgets/row.dart';
class Detailspage extends StatefulWidget {
  final String imagePath;
  const Detailspage({Key? key,  required this.imagePath}) : super(key: key);

  @override
  State<Detailspage> createState() => _DetailspageState();
}

class _DetailspageState extends State<Detailspage> {
  int count = 0;
  final ScrollController _scrollController = ScrollController();
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet:
      const AddToCard(),
      appBar: AppBar(
        toolbarHeight: 52,
        backgroundColor: Colors.transparent,
        title: const Text("Product details",style:TextStyle(
          fontSize: 16,
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Stack(
              alignment: Alignment.center,
              children: [
                SvgPicture.asset('icon/bag.svg'),
                Positioned(
                  right: 0,
                  bottom: 7,
                  child: Consumer<CartProvider>(
                    builder: (context, cart, child) {
                      return cart.count > 0
                          ? Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${cart.count}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                          : Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),


      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(bottom:90),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                widget.imagePath,
              ),
            const SizedBox(height: 16,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding:   const EdgeInsets.fromLTRB(0, 16, 0,24),
                  child: Row(

                    children: [
                      SizedBox(width: 8,),
                      for (int index = 0; index < images.length; index++)
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),

                            ),
                            child: ImageCard(
                              imageHeight: 72,
                              imageWidth: 72,
                              imagePath: widget.imagePath,

                            ),
                          ),
                        ),
<<<<<<< HEAD
=======
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

                      
                          if (4.5 % 1 != 0)
                            Icon(Icons.star_half, color: Colors.green),
                        ],
                      ),
                      Text("(65)"),
>>>>>>> 202cc522e6643469d0bb9cca307a67de60d62a0a
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
                  children: [
                    const Text("Ekaa Kombuchaa - fressa - 300ml",style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ItemsinRow(name: "Rs250", name2: ""),
                        Wrap(
                          alignment: WrapAlignment.start,

                          spacing: -2.0,

                          children: [

                            for (int i = 0; i < 4; i++)
                              const Icon(Icons.star, color: Colors.green),


                            if (4.5 % 1 != 0)
                              const Icon(Icons.star_half, color: Colors.green),
                          ],
                        ),
                        const Text("(65)"),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ItemsinRow(name: "Variations", name2: "Strawberry,300ml  > "),
                    const SizedBox(height: 12,),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0,16, 16, 16),
                      child: Text(
                        "  Kombucha General Health Benefits:1. Probitics for Gut health2. Prebiotics (gluconic acid) for Gut health 3. Detoxification effect (glucuronic acid) 4. Antimicrobials effect (Acetic acid)5. Antioxidants6.",style: TextStyle(
                        fontSize: 15,
                      ),),
                    ),

                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Recommended For you",style: TextStyle(fontSize: 24,color: Colors.green,fontWeight: FontWeight.bold),),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding:   const EdgeInsets.fromLTRB(0, 16, 0,24),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
<<<<<<< HEAD
                      const SizedBox(width: 8,),
                      for (int index = 0; index < images.length; index++)
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: ImageCard(
                            imageHeight: 136,
                              imageWidth: 280,
                              imagePath: images[index],
                              name: names[index],
                              showRating: true,
                              price: "Rs 250"),
                        ),
=======
                      Text("4.4",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(width: 6,),
                      Wrap(
                        alignment: WrapAlignment.start,
                        
                        spacing: -2.0,
                       
                        children: [
                          // Loop to generate full stars
                          for (int i = 0; i < 4; i++)
                            Icon(Icons.star, color: Colors.green),

                      
                          if (4.5 % 1 != 0)
                            Icon(Icons.star_half, color: Colors.green),
                        ],
                      ),
>>>>>>> 202cc522e6643469d0bb9cca307a67de60d62a0a
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
                  children: [
                    const Text("Review & ratings",style: TextStyle(fontWeight:FontWeight.w100,fontSize: 16, ),),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        const Text("4.4",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

                        Wrap(
                          alignment: WrapAlignment.start,

                          spacing: -2.0,

                          children: [

                            for (int i = 0; i < 4; i++)
                              const Icon(Icons.star, color: Colors.green),

                            if (4.5 % 1 != 0)
                              const Icon(Icons.star_half, color: Colors.green),
                          ],
                        ),
                      ],
                    ),
<<<<<<< HEAD
                    const SizedBox(height: 16,),
                    const Text("Based on 65 Ratings"),
                    const Ratings(image: 'images/food1.jpg', name: "Wade waren", name2: "2h ago", description: "Amazing experience at this computer retail store! The staff was knowledgeable and helped me find the perfect laptop within my budget. Fast service and a wide selection of products. Highly recommended!", showImages: true,maxImages: 4,),
                    const Ratings(image: "images/food2.jpg", name: "Theresa Webb", name2: "2d ago", description: "Top-notch customer service! I visited this computer store looking for a gaming PC, and the team went above and beyond to guide me through the options. I'm thrilled with my purchase and will be a loyal customer!",showImages: true,maxImages: 2,),
                    const Ratings(image:"images/food3.jpg", name:"Cameroon williamson", name2: "3m Ago", description: "Impressed with the quality and variety of computers available here. The store had everything from sleek ultrabooks to powerful workstations. I found exactly what I needed, and the price was competitive too!", showImages: false,maxImages: 0,),
                    const Center(child: Text("View all reviews",style: TextStyle(color: Colors.green),)),
=======
                      Spacer(),
                      ElevatedButton.icon(
                        onPressed: () {
                   
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green, // Background color
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          textStyle: TextStyle(fontSize: 16),
                        ),
                        icon: Icon(Icons.shopping_bag, color: Colors.white),
                        label: Text('Add to cart',style: TextStyle(
                          color: Colors.white,
                        ),),
                      ),

>>>>>>> 202cc522e6643469d0bb9cca307a67de60d62a0a

                    // const AddToCard(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
