// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:public_toilets/models/toilets.dart';

class ToiletListItem extends StatelessWidget {
  final Toilet toilet;

  const ToiletListItem({
    super.key,
    required this.toilet,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(Icons.home, size: 30.0),
            Expanded(
              child: Text(
                toilet.name,
                style: TextStyle(fontSize: 24.0, color: Colors.red),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    // collection if, ไม่ใช่ if statement
                    if (toilet.point > 2.5)
                      Text('GOOD'),

                    // collection for, ไม่ใช่ for statement
                    RatingBar.builder(
                      initialRating: toilet.point,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);

                      },
                    ),

                    Text(toilet.point.toString())
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
