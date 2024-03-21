import 'package:flutter/material.dart';
import 'package:food_service/common/color_extension.dart';
import 'package:food_service/common_widget/restaurant_details.dart';
import 'package:food_service/common_widget/round_button.dart';
import 'package:food_service/common_widget/round_icon_button.dart';
import 'package:food_service/common_widget/round_textfield.dart';
import 'package:food_service/outlet/outlet_view.dart';

class OutletDetailedViewState extends StatefulWidget {
  final String cityName;

  const OutletDetailedViewState({Key? key, required this.cityName}) : super(key: key);


  @override
  State<OutletDetailedViewState> createState() =>
      __OutletDetailedViewStateState();
}

class __OutletDetailedViewStateState extends State<OutletDetailedViewState> {
  String selectedCity = "City"; // Default city name

  void updateCity(String cityName) {
    setState(() {
      selectedCity = cityName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => OutletViewState()),
            );
          },
        ),
        title: Text(
          "Explore ${widget.cityName} outlets",
          style: TextStyle(
            color: TColor.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "Search Outlets",
                  // controller: txtSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 20,
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
              RestaurantCard(
                restaurantName: "Vishal Restaurant",
                locationName: "Bedi Road",
                restaurantType: "Pure-Veg",
                rating: 3.5,
                totalReviews: 500,
              ),
              const SizedBox(height: 10),
              RestaurantCard(
                restaurantName: "JK Restro",
                locationName: "Bedi Road",
                restaurantType: "Pure-Veg",
                rating: 3.5,
                totalReviews: 500,
              ),
              const SizedBox(height: 10),
              RestaurantCard(
                restaurantName: "Hotel Madhav",
                locationName: "Bedi Road",
                restaurantType: "Pure-Veg",
                rating: 3.5,
                totalReviews: 500,
              ),
              
              const SizedBox(height: 10),
              RestaurantCard(
                restaurantName: "Hotel JD",
                locationName: "Bedi Road",
                restaurantType: "Pure-Veg",
                rating: 3.5,
                totalReviews: 500,
              ),
            ],
          ),
        ),
      ),
    );
  }
}