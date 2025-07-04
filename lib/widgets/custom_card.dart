import 'package:flutter/material.dart';
import 'package:weathertest/models/topcities_model.dart';

class CustomCard extends StatelessWidget {
  final TopcitiesModel topcitiesModeldetails;
  const CustomCard({super.key, required this.topcitiesModeldetails});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              topcitiesModeldetails.rank.toString(),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 5),
            Text(
              topcitiesModeldetails.country.id,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 5),
            Text(
              topcitiesModeldetails.country.englishName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
            SizedBox(height: 5),
            Text(
              topcitiesModeldetails.englishName,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
