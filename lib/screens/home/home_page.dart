// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:public_toilets/models/toilets.dart';
import 'package:public_toilets/repository/toillet_repository.dart';
import 'package:public_toilets/screens/home/toilet_list_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _toiletNameController = TextEditingController();
  final _toiletDistanceController = TextEditingController();
  double rating = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Public Toilets'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: ToiletRepository.toilets.length,
              itemBuilder: (ctx, i) {
                Toilet toilet = ToiletRepository.toilets[i];

                return ToiletListItem(
                  toilet: toilet,
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _toiletNameController,
                  decoration: InputDecoration(
                    hintText: 'ชื่อห้องน้ำ',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 3,
                        color: Colors.greenAccent,
                      ), //<-- SEE HERE
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: RatingBar.builder(
                        initialRating: rating,
                        minRating: 0,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          this.rating = rating;
                          print(rating);
                        },
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _toiletDistanceController,
                        decoration: InputDecoration(
                          hintText: 'ระยะทาง',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.greenAccent,
                            ), //<-- SEE HERE
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                      onPressed: () {
                        var toiletName = _toiletNameController.text;
                        var toiletDistance = _toiletDistanceController.text;
                        var toilet = Toilet(
                            name: toiletName,
                            point: rating,
                            distance: double.parse(toiletDistance),
                        );
                        setState(() {
                          ToiletRepository.toilets.add(toilet);
                        });
                        _toiletNameController.clear();
                        _toiletDistanceController.clear();
                      },
                      child: Text('ADD'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
