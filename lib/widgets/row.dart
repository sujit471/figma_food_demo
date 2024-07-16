import 'package:flutter/material.dart';
class ItemsinRow extends StatelessWidget {
   ItemsinRow({Key? key, required this.name, required this.name2}) : super(key: key);
  final String ?name;
  final String ?name2;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name!,

            style: TextStyle(
              fontSize: 24,
            color: Colors.black

          ),),
          Text(name2!,style: TextStyle(
            color:Colors.grey
          ),),
        ],
      )
    );
  }
}
