import 'dart:math';

import 'package:assignmentflutter/utils/mycolors.dart';
import 'package:assignmentflutter/utils/textThemes.dart';
import 'package:flutter/material.dart';

import '../../model/productmodel.dart';

class ListView_separated extends StatelessWidget {
var datas = [
  Data(
      name: "Filodendro Atom ",
      stringdata: '250 ml',
      image: "assets/image/filodendro.png"),
  Data(
      name: "Monstera Deliciosa",
      image: "assets/image/monstera.png",
      stringdata: "500 ml"),
  Data(
      name: "Chlorophytum",
      image: "assets/image/chlorophytum.png",
      stringdata: "500ml"),
  Data(
      name: "Kentiapalm",
      image: "assets/image/kentiapalm.png",
      stringdata: "250 ml"),
  Data(
      name: "Peperomia Obtusifolia",
      image: "assets/image/peperomia.png",
      stringdata: "250 ml"),
];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.settings),
        title: Text("Water Today"),
        actions: [
        CircleAvatar(
          backgroundColor: Colors.cyan,
          child: Icon(Icons.add),
        ),
        ],
      ),
      body: ListView.separated(
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 200,
              decoration: BoxDecoration(
                color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('${datas[index].image}'),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text(
                    datas[index].name!,
                    style: MyTextThemes.textHeading,
                  ),
                  Text(
                    datas[index].stringdata!,
                    style: MyTextThemes.bodyTextStyle,
                  ),
                  ],
                  ),
                  const Icon(Icons.water_drop_outlined)
                ],
              ),
              ),
            );
      },
          separatorBuilder: (context,index){
            if(index % 3 == 0){
            return Text('Fri, February 7',style: MyTextThemes.textHeading,);
          }else {
              return Container();
            }
    },
          itemCount: 5),
    );
  }
}