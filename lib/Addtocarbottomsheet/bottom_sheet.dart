import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/card_provider.dart';
class AddToCard extends StatefulWidget {
  const AddToCard({Key? key}) : super(key: key);

  @override
  State<AddToCard> createState() => _AddToCardState();
}

class _AddToCardState extends State<AddToCard> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
   return Container(
     height: 64,
     color: Colors.white,
     padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
     child: Row(

       children: [

       //  const Center(child: Text("View all reviews",style: TextStyle(color: Colors.green),)),
         Row(
           children: [
             IconButton(
               onPressed: () {
                 setState(() {
                   if (count > 1) count--;
                 });
               },
               icon: const Icon(Icons.remove, color: Colors.green),
             ),
             Text(
               '$count',
               style: const TextStyle(fontSize: 18),
             ),
             IconButton(
               onPressed: () {
                 setState(() {
                   count++;
                 });
               },
               icon: const Icon(Icons.add, color: Colors.green),
             ),
           ],
         ),
         Spacer(),
         ElevatedButton.icon(
           onPressed: () {
             context.read<CartProvider>().addItem();
           },
           style: ElevatedButton.styleFrom(
             backgroundColor: Colors.green, // Background color
             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Padding inside button
             textStyle: const TextStyle(fontSize: 16),
           ),
           icon: const Icon(Icons.shopping_bag, color: Colors.white),
           label: const Text('Add to cart',style: TextStyle(
             color: Colors.white,
           ),),
         ),


       ],
     ),
   );
  }
}

