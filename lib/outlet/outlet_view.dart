import 'package:flutter/material.dart';
import 'package:food_service/common/color_extension.dart';
import 'package:food_service/common_widget/city_model.dart';
import 'package:food_service/common_widget/round_button.dart';
import 'package:food_service/common_widget/round_icon_button.dart';
import 'package:food_service/common_widget/round_textfield.dart';
import 'package:food_service/outlet/outlet_details.dart';
import 'package:get/get.dart';

class OutletViewState extends StatefulWidget {
  const OutletViewState({super.key});

  @override
  State<OutletViewState> createState() => __OutletViewStateState();
}

class __OutletViewStateState extends State<OutletViewState> {
  String selectedCity = "City";

  void updateCity(String cityName) {
    setState(() {
      selectedCity = cityName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Select an outlet",
                  style: TextStyle(
                      color: TColor.primaryText,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: RoundTextfield(
              hintText: "Search Outlet",
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
            height: 10,
          ),
          Center(
            child: Text(
              "Choose by City",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CityCard(
            city: CityModel(
              cityStartingLetter: "A",
              cityNames: [
                "Ahmedabad",
                "Abohar",
                "Agra",
                "Ajmer",
                "Amreli",
                "Anand",
                "Ayodhya"
              ],
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "B",
              cityNames: ["Bhavnagar", "Bhuj"],
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "C",
              cityNames: ["Chandigarh",]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "D",
              cityNames: ["Daman", "Diu"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "E",
              cityNames: ["Coming Soon"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "F",
              cityNames: ["Faridabad",]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "G",
              cityNames: ["Gandhinagar", "Gandhidham"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "H",
              cityNames: ["Hyderabad"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "I",
              cityNames: ["Indore"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "J",
              cityNames: ["Jharkhand", "Jamnagar"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "K",
              cityNames: ["Kanpur"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "L",
              cityNames: ["Lucknow"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "M",
              cityNames: ["Mumbai"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "N",
              cityNames: ["Nagpur"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "O",
              cityNames: ["Odisha"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "P",
              cityNames: ["palanpur"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "Q",
              cityNames: ["Coming Soon"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "R",
              cityNames: ["Rajkot"]
            ),onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "S",
              cityNames: ["Solapur"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "T",
              cityNames: ["Thane"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "U",
              cityNames: ["Udaipur"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "V",
              cityNames: ["Vadodara"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "W",
              cityNames: ["Wadhwan"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "X",
              cityNames: ["Coming Soon"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "Y",
              cityNames: ["Yamunagar"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 10),
          CityCard(
            city: CityModel(
              cityStartingLetter: "Z",
              cityNames: ["Zirakpur"]
            ),
            onPressed: (String cityName) {
              updateCity(cityName);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      OutletDetailedViewState(cityName: cityName),
                ),
              );
            },
          ),
          const SizedBox(height: 15),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RoundButton(title: "Use My Current Location", onPressed: () {}),
      ),
    );
  }
}
