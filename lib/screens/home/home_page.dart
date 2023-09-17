import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:public_toilets/models/toilets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Toilet> toilets = [
    Toilet(name: 'ห้องน้ำ 1',point: 4.1,distance: 350.0, ),
    Toilet(name: 'ห้องน้ำ 2',point: 4.5,distance: 50.0, ),
    Toilet(name: 'ห้องน้ำ 3',point: 3.7,distance: 350.0, ),
    Toilet(name: 'ห้องน้ำ 4',point: 4.0,distance: 220.0, ),
    Toilet(name: 'ห้องน้ำ 5',point: 2.5,distance: 550.0, ),
  ];

  Widget _buildItem(BuildContext context, int index){
    Toilet toilet = toilets[index];

    return ToiletListItem(
      toilet: toilet,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Public Toilets')),),
      body: ListView.builder(
        itemCount: toilets.length,
        itemBuilder: (ctx, i){
          Toilet toilet = toilets[i];
          return ToiletListItem(toilet: toilet);
        },
      ),//call back function

      /*body: ListView(
        children: [
          ToiletListItem(toilet: Toilet(name: 'ห้องน้ำ 1',point: 1.0,distance: 100.0)),
          ToiletListItem(toilet: Toilet(name: 'ห้องน้ำ 2',point: 2.0,distance: 200.0)),
          ToiletListItem(toilet: Toilet(name: 'ห้องน้ำ 3',point: 3.0,distance: 300.0)),
          ToiletListItem(toilet: Toilet(name: 'ห้องน้ำ 4',point: 4.0,distance: 400.0)),
          ToiletListItem(toilet: Toilet(name: 'ห้องน้ำ 5',point: 5.0,distance: 500.0)),
        ],
      ),*/
    );
  }
}

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
