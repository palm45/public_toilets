// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:public_toilets/models/toilets.dart';

class ToiletListItem extends StatelessWidget {
  final Toilet toilet;

  ToiletListItem({
    super.key,
    required this.toilet
  });

  @override
  Widget build(BuildContext context) {
    /*List<Widget> star = [] ;

    for(var i=0;i<5;i++){
      star.add(Icon(Icons.star))
    }*/



    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.home, size: 30.0,),
            Expanded(
                child: Text(
                  toilet.name,
                  style:TextStyle(fontSize: 24.0,color: Colors.red),
                )
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    if(toilet.point > 3)
                      Text('GOOD'),
                    // collection for ไม่ใช่ for statement
                    for(var i=0;i<toilet.point.round();i++)
                      Icon(Icons.star),
                    Text(toilet.point.toString()),
                  ],
                ),
                Text(toilet.distance.toString())
              ],
            ),
          ],
        ),
      ),
    );
  }
}
