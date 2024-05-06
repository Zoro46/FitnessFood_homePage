import 'package:flutter/cupertino.dart';

class DietModel{
  String name;
  String iconPath;
  String level;
  String duration;
  String colorie;
  bool viewIsSelected;
  Color boxColor;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.colorie,
    required this.viewIsSelected,
    required this.boxColor
  });

 static List< DietModel > getDiets() {
    List< DietModel > diets =[];

    diets.add(
      DietModel(
          name: "Honey Pancake",
          iconPath: 'assets/Icons/honey_pancake.png',
          level: "Easy",
          duration: "30mins",
          colorie: "180kCal",
          viewIsSelected: true,
          boxColor: Color(0xff92A3FD)
      )
    );
      diets.add(
        DietModel(
          name: "Canai Bread",
          iconPath: 'assets/Icons/canai_bread.png',
          level: "Easy",
          duration: "20mins",
          colorie: "230kCal",
          viewIsSelected: false,
            boxColor: Color(0xffC58BF2)
      )
    );
      diets.add(
        DietModel(
          name: "Apple Juice",
          iconPath: 'assets/Icons/apple-juice.png',
          level: "Easy",
          duration: "10mins",
          colorie: "133Cal",
          viewIsSelected: false,
            boxColor: Color(0xff92A3FD)
      )
    );

    return diets;
  }

}

