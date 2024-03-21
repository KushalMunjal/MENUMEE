// import 'package:flutter/material.dart';
// import 'package:food_service/outlet/outlet_details.dart';

// class CityModel {
//   final String cityStartingLetter;
//   final List<String> cityNames;

//   CityModel({
//     required this.cityStartingLetter,
//     required this.cityNames,
//   });
// }

// class CityCard extends StatelessWidget {
//   final CityModel city;

//   CityCard({required this.city});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 3,
//       margin: EdgeInsets.symmetric(horizontal: 20),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: 40,
//               height: 40,
//               decoration: BoxDecoration(
//                 color: Colors.deepOrange,
//                 shape: BoxShape.circle,
//               ),
//               child: Center(
//                 child: Text(
//                   city.cityStartingLetter,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(width: 20),
//             Flexible(
//               child: Wrap(
//                 spacing: 10.0, // Adjust the space between city names
//                 runSpacing: 10.0, // Adjust the space between rows
//                 children: [
//                   for (int i = 0; i < city.cityNames.length; i++)
//                     GestureDetector(
//                       onTap: () {
//                       },
//                       child: Container(
//                         padding:
//                             EdgeInsets.symmetric(vertical: 8, horizontal: 12),
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(232, 255, 136, 100),
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: Text(
//                           city.cityNames[i],
//                           style: TextStyle(
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:food_service/outlet/outlet_details.dart';

class CityModel {
  final String cityStartingLetter;
  final List<String> cityNames;

  CityModel({
    required this.cityStartingLetter,
    required this.cityNames,
  });
}

class CityCard extends StatelessWidget {
  final CityModel city;
  final Function(String cityName) onPressed;

  CityCard({required this.city, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  city.cityStartingLetter,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 20),
            Flexible(
              child: Wrap(
                spacing: 10.0, // Adjust the space between city names
                runSpacing: 10.0, // Adjust the space between rows
                children: [
                  for (int i = 0; i < city.cityNames.length; i++)
                    GestureDetector(
                      onTap: () {
                        onPressed(city.cityNames[i]);
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(232, 255, 136, 100),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          city.cityNames[i],
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}