import 'package:flutter/material.dart';
import 'package:food_delivery_app/color_constants.dart';
import 'package:food_delivery_app/models/food_item.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodTile extends StatelessWidget {
  final FoodItem foodItem;

  const FoodTile({Key key, this.foodItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        Card(
          elevation: 10,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
          shadowColor: const Color(0xffF7CBAB),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(
              horizontal: 25,
              vertical: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  foodItem.name,
                  style: GoogleFonts.varelaRound(
                      fontWeight: FontWeight.w600, fontSize: 18),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '\$${foodItem.price}',
                  style: GoogleFonts.varelaRound(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: ColorConstants.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: -10,
          top: -30,
          child: Image.asset(
            foodItem.imagePath,
            height: 120,
            width: 120,
          ),
        ),
      ],
    );
  }
}
