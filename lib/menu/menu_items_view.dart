import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_service/common/color_extension.dart';
import 'package:food_service/common_widget/round_textfield.dart';

import '../../common_widget/menu_item_row.dart';
import 'item_details_view.dart';

class MenuItemsView extends StatefulWidget {
  final Map mObj;
  const MenuItemsView({super.key, required this.mObj});

  @override
  State<MenuItemsView> createState() => _MenuItemsViewState();
}

class _MenuItemsViewState extends State<MenuItemsView> {
  TextEditingController txtSearch = TextEditingController();

  List menuItemsArr = [
    {
      "image": "assets/images/dess_1.png",
      "name": "French Apple Pie",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Desserts"
    },
    {
      "image": "assets/images/dess_2.png",
      "name": "Dark Chocolate Cake",
      "rate": "4.9",
      "rating": "124",
      "type": "Cakes by Tella",
      "food_type": "Desserts"
    },
    {
      "image": "assets/images/dess_3.png",
      "name": "Street Shake",
      "rate": "4.9",
      "rating": "124",
      "type": "Café Racer",
      "food_type": "Desserts"
    },
    {
      "image": "assets/images/dess_4.png",
      "name": "Fudgy Chocolate Brownies",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Desserts"
    },
    {
      "image": "assets/images/dess_1.png",
      "name": "French Apple Pie",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Desserts"
    },
    {
      "image": "assets/images/dess_2.png",
      "name": "Chocolate Brownie Cake",
      "rate": "4.9",
      "rating": "124",
      "type": "Cakes by Tella",
      "food_type": "Desserts"
    },
    {
      "image": "assets/images/dess_3.png",
      "name": "Street Chocolate Shake",
      "rate": "4.9",
      "rating": "124",
      "type": "Café Racer",
      "food_type": "Desserts"
    },
    {
      "image": "assets/images/shop_logo.png",
      "name": "Classic Burger",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Burger"
    },
    {
      "image": "assets/images/cat_offer.png",
      "name": "Mexican Burger",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Burger"
    },
    {
      "image": "assets/images/shop_logo.png",
      "name": "Tandoori Burger",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Burger"
    },
    {
      "image": "assets/images/cat_offer.png",
      "name": "Cheese Burger",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Burger"
    },
    {
      "image": "assets/images/menu_4.png",
      "name": "Italian Burger",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Burger"
    },
    {
      "image": "assets/images/detail_top.png",
      "name": "Classic Pizza",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Pizza"
    },
    {
      "image": "assets/images/item_1.png",
      "name": "Mexican Pizza",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Pizza"
    },
    {
      "image": "assets/images/item_3.png",
      "name": "Tandoori Pizza",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Pizza"
    },
    {
      "image": "assets/images/m_res_1.png",
      "name": "Cheese Pizza",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Pizza"
    },
    {
      "image": "assets/images/res_1.png",
      "name": "Italian Pizza",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Pizza"
    },
    {
      "image": "assets/images/combo1.png",
      "name": "Classic Burger-Fries",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Combos"
    },
    {
      "image": "assets/images/combo2.png",
      "name": "Cheese Burger-Pizza",
      "rate": "4.9",
      "rating": "124",
      "type": "Minute by tuk tuk",
      "food_type": "Combos"
    },
  ];

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
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          SvgPicture.asset("assets/icons/leftarrow.svg"),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Text(
                        widget.mObj["name"].toString(),
                        style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 20,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
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
                height: 15,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: menuItemsArr.length,
                itemBuilder: ((context, index) {
                  var mObj = menuItemsArr[index];

                  // Check if food_type and name match with widget.mObj
                  if (mObj['food_type'] == widget.mObj['name']) {
                    return MenuItemRow(
                      mObj: mObj,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetailsView(
                              image: mObj['image'],
                              title: mObj['name'],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    // Return an empty container if the item doesn't match
                    return Container();
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
