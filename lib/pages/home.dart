import 'package:first_app/models/category_model.dart';
import 'package:first_app/models/diet_model.dart';
import 'package:first_app/models/popular_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];
  List<DietModel> diets = [];
  List<PopularDietModel> popularDiets = [];

  void _getInitialInfo(){
   categories = CategoryModel.getCategories();
   diets = DietModel.getDiets();
   popularDiets = PopularDietModel.getPopularDiets();
  }


  @override
  Widget build(BuildContext context) {
    _getInitialInfo();
    return Scaffold(
      appBar: buildAppBar(), // AppBar
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Search_field(),   // Search Bar
          const SizedBox(height: 40,),
          Categories_section(),   // Category Section
          const SizedBox(height: 40,),
          Diet_section(),    //  Diet Section
          const SizedBox(height: 40,),
          Popular_section(),    // Popular Section
          const SizedBox(height: 40,)
        ],
      ),
    );
  }

  Column Popular_section() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: Text("Popular",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
              ),
            ),
            const SizedBox(height: 15),
            ListView.separated(
                itemBuilder: (context, index){
              return Container(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FittedBox(child: Image.asset(popularDiets[index].iconPath, height: 65,width: 65,)),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popularDiets[index].name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),

                        Text(
                          popularDiets[index].level + '|' + popularDiets[index].duration + '|' + popularDiets[index].calorie,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff7B6F72),
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                        onTap: (){},
                        child: IconButton(
                          onPressed: (){},
                          icon: Image.asset('assets/Icons/arrow-right.png',height: 30,width: 30,),
                        )
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: popularDiets[index].boxIsSelected ?
                  Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: popularDiets[index].boxIsSelected ? [
                    BoxShadow(
                        color: const Color(0xff1D1617).withOpacity(0.07),
                      offset: const Offset(0, 10),
                      blurRadius: 40,
                      spreadRadius: 0
                    )
                  ] : []
                ),
        //
                  );
                },
                shrinkWrap: true,
                separatorBuilder: (context, index) => const SizedBox(height: 25.0,),
                itemCount: popularDiets.length
            ),

          ]
        );
  }

  Column Diet_section() {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text("Recommendation \nfor Diet", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),),
            ),
            // SizedBox(
            //   height: 5,
            // ),
            const SizedBox(height: 15),
            Container(
              height: 240,
              child: ListView.separated(
                  itemCount: diets.length,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(
                      left: 20,
                      right: 20
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 25,),
                  itemBuilder: (context, index){
                return Container(
                  width: 210,
                  decoration: BoxDecoration(
                    color: diets[index].boxColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(20),
                  ),

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FittedBox(child: Image.asset(diets[index].iconPath,width: 125.0, height: 100.0,)),

                      Text(
                        diets[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),

                      Text(
                        diets[index].level + '|' + diets[index].duration + '|' + diets[index].colorie,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff7B6F72),
                        ),
                      ),

                      Container(
                        height: 45,
                        width: 130,
                        child: Center(
                          child: Text("View",style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14,color: Colors.white),),
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              diets[index].viewIsSelected ? Color(0xff9DCEFF) : Colors.transparent,
                              diets[index].viewIsSelected ? Color(0xff92A3fD) : Colors.transparent,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50.0)
                        ),
                      )
                    ],
                  ),
                );
              }),
            ),
          ],
        );
  }

  Column Categories_section() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(
                children: [
                  Text("Category", style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600, color: Colors.black)),
                ],
              ),
            ),

            const SizedBox(height: 15),
            Container(
              height: 120.0,
              child: ListView.separated(
                itemCount: categories.length ,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(width: 25,),
                  padding:const EdgeInsets.only(
                    left: 20,
                    right: 20
                  ),
                  itemBuilder: (context, index){
                    return Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: categories[index].boxColor.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle
                            ),

                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                                child: Image.asset(categories[index].iconPath)
                            ),
                          ),

                          Text(
                            categories[index].name,
                            style: const  TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    );
                  },
              ),
            ),
          ],
        );
  }

  Container Search_field() {
    return Container(
          margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
          decoration: BoxDecoration(
            boxShadow:[
              BoxShadow(
                color: Color(0xff1D1617).withOpacity(0.14),
                blurRadius: 40.0,
                spreadRadius: 0.0,
                ),
            ]
          ),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,

              hintText: "Search Pancake",
              hintStyle: const TextStyle(
                color: Color(0xffDDDADA),
                fontSize: 14,
              ),

              contentPadding: const EdgeInsets.all(10),

              prefixIcon: const Icon(Icons.search),

              suffixIcon: Container(
                width: 100,
                child: IntrinsicHeight(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const VerticalDivider(
                        color: Colors.black,
                        thickness: 0.1,
                        indent: 10.0,
                        endIndent: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0,bottom: 12.0,right: 12.0),
                        child: Image.asset('assets/Icons/filter_icon.png', height: 23.0, width: 23.0,),
                      ),
                    ],
                  ),
                ),
              ),

              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none
              ),
            ),
          ),
        );
  }


  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xffDDDADA).withOpacity(0.13),

      //Title of Appbar
      title: const Text("Breakfast", style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: Colors.black),),
      centerTitle: true,
      elevation: 0.0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: (){},
      ),

    );
  }
}
