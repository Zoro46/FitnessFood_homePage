import 'dart:ui';

class CategoryModel{
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
          name: "Salad",
          iconPath: 'assets/Icons/salad.png',
          boxColor: Color(0xff92A3FD)
      )
    );

    categories.add(
      CategoryModel(
          name: "Cake",
          iconPath: 'assets/Icons/cake.png',
          boxColor: Color(0xffC58BF2)
      )
    );

    categories.add(
      CategoryModel(
          name: "Pie",
          iconPath: 'assets/Icons/pie.png',
          boxColor: Color(0xff92A3FD)
      )
    );

    categories.add(
      CategoryModel(
          name: "Smoothies",
          iconPath: 'assets/Icons/smoothie.png',
          boxColor: Color(0xffC58BF2)
      )
    );
    return categories;
  }
}