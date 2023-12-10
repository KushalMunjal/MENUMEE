import 'package:flutter/material.dart';
import 'package:food_service/common/color_extension.dart';
import 'package:food_service/common_widget/menu_item_row.dart';
import 'package:food_service/menu/item_details_view.dart';
import 'package:food_service/menu/menu_view.dart';
import 'package:food_service/tabview/main_tabview.dart';
import '../common_widget/round_textfield.dart';

import '../../../common_widget/category_cell.dart';
import '../../../common_widget/most_popular_cell.dart';
import '../../../common_widget/popular_resutaurant_row.dart';
import '../../../common_widget/recent_item_row.dart';
import '../../../common_widget/view_all_title_row.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txtSearch = TextEditingController();

  List catArr = [
    {"image": "assets/images/combo2.png", "name": "Combo Offers"},
    {"image": "assets/images/detail_top.png", "name": "Pizza"},
    {"image": "assets/images/cat_offer.png", "name": "Burger"},
    {"image": "assets/images/dess_4.png", "name": "Desserts"},
  ];

  List popArr = [
    {
      "image": "assets/images/res_1.png",
      "name": "Basil Pizza",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/m_res_1.png",
      "name": "Margerita Pizza",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/combo1.png",
      "name": "Burger-Fries Combos",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
  ];

  List mostPopArr = [
    {
      "image": "assets/images/m_res_1.png",
      "name": "Basil Pizza",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/shop_logo.png",
      "name": "Burger",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
  ];

  List recentArr = [
    {
      "image": "assets/images/item_1.png",
      "name": "Mexican Pizza",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/dess_2.png",
      "name": "Dark Chocolate Cake",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/item_3.png",
      "name": "Italian Pizza",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafa",
      "food_type": "Western Food"
    },
  ];

  void navigateToItemDetails(Map itemDetails) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemDetailsView(
          image: itemDetails['image'],
          title: itemDetails['name'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 46,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "MENUMEE Restuarant",
                      style: TextStyle(
                          color: TColor.primaryText,
                          fontSize: 20,
                          fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Enjoy Your Meal",
                          style: TextStyle(
                              color: TColor.secondaryText,
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "Search Food",
                  controller: txtSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: Image.asset(
                      "assets/images/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Categories",
                  onView: () {},
                ),
              ),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: catArr.length,
                  itemBuilder: ((context, index) {
                    var cObj = catArr[index] as Map? ?? {};
                    return CategoryCell(
                      cObj: cObj,
                      onTap: () {},
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Popular Dishes",
                  onView: () {},
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: popArr.length,
                itemBuilder: ((context, index) {
                  var pObj = popArr[index] as Map? ?? {};
                  return PopularRestaurantRow(
                    pObj: pObj,
                    onTap: () {
                      navigateToItemDetails(pObj);
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Most Liked",
                  onView: () {},
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: mostPopArr.length,
                  itemBuilder: ((context, index) {
                    var mObj = mostPopArr[index] as Map? ?? {};
                    return MostPopularCell(
                      mObj: mObj,
                      onTap: () {
                        navigateToItemDetails(mObj);
                      },
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "CheF's Special",
                  onView: () {},
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: recentArr.length,
                itemBuilder: ((context, index) {
                  var rObj = recentArr[index] as Map? ?? {};
                  return RecentItemRow(
                    rObj: rObj,
                    onTap: () {
                      navigateToItemDetails(rObj);
                    },
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
