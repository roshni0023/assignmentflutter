import 'package:assignmentflutter/utils/textThemes.dart';
import 'package:flutter/material.dart';

import '../../model/productmodel.dart';

class GridView1 extends StatelessWidget {
  var photos = [
    Data(
      image: "assets/image/usa.png",
      stringdata: "USA"
    ),
    Data(
        image: "assets/image/england.png",
        stringdata: "England"
    ),
    Data(
        image: "assets/image/france.png",
        stringdata: "France"
    ),
    Data(
        image: "assets/image/russia.png",
        stringdata: "Russia"
    ),
    Data(
        image: "assets/image/canada.png",
        stringdata: "Canada"
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('GridView()'),
        ),
        body: GridView.builder(
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4,mainAxisSpacing: 4),
          itemCount: 5,
          itemBuilder: ((context,index){
            return Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage('${photos[index].image}'),
                      fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                    photos[index].stringdata!,
                    style: MyTextThemes.textHeading,
                )
              ],
            );
          }),
    ),
    );
  }
}
