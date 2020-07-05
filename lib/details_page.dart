import 'package:flutter/material.dart';
import 'package:food_delivery_app/color_constants.dart';
import 'package:food_delivery_app/widgets/food_tile.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_delivery_app/models/category.dart';
import 'package:food_delivery_app/models/food_item.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  List<Category> data = [
    Category(
      id: 1,
      name: 'POPULAR',
      foodList: <FoodItem>[
        FoodItem(
            id: 1,
            name: 'Chicago Hot Dog',
            price: 5.99,
            imagePath: 'assets/images/hamburger.png'),
        FoodItem(
            id: 2,
            name: 'Greek Shaurama',
            price: 6.99,
            imagePath: 'assets/images/hotdog.png'),
      ],
    ),
    Category(
      id: 2,
      name: 'MEAL DEALS',
      foodList: <FoodItem>[
        FoodItem(
            id: 3,
            name: 'Fix Meal',
            price: 10.99,
            imagePath: 'assets/images/hamburger.png'),
        FoodItem(
            id: 4,
            name: 'Maxican Meal',
            price: 12.99,
            imagePath: 'assets/images/hamburger.png'),
      ],
    ),
    Category(
      id: 3,
      name: 'HOT DOGS',
      foodList: <FoodItem>[
        FoodItem(
            id: 1,
            name: 'Chicago Hot Dog',
            price: 5.99,
            imagePath: 'assets/images/hamburger.png'),
        FoodItem(
            id: 5,
            name: 'Hot Dog',
            price: 4.99,
            imagePath: 'assets/images/hamburger.png'),
      ],
    ),
    Category(
      id: 4,
      name: 'BURGERS',
      foodList: <FoodItem>[
        FoodItem(
            id: 6,
            name: 'Burger',
            price: 5.99,
            imagePath: 'assets/images/hamburger.png'),
        FoodItem(
            id: 7,
            name: 'Bacon Clubhouse Burger',
            price: 7.99,
            imagePath: 'assets/images/hamburger.png'),
        FoodItem(
            id: 8,
            name: 'Hamburger',
            price: 9.99,
            imagePath: 'assets/images/hamburger.png'),
      ],
    ),
    Category(
      id: 4,
      name: 'PIZZAS',
      foodList: <FoodItem>[
        FoodItem(
            id: 9,
            name: 'Margherita',
            price: 15.99,
            imagePath: 'assets/images/pizza-1.png'),
        FoodItem(
            id: 10,
            name: 'Double Cheese Margherita',
            price: 18.99,
            imagePath: 'assets/images/pizza-2.png'),
        FoodItem(
            id: 11,
            name: 'Pepper',
            price: 16.99,
            imagePath: 'assets/images/pizza-1.png'),
        FoodItem(
            id: 12,
            name: 'Zesty Chicken',
            price: 22.99,
            imagePath: 'assets/images/pizza-2.png'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF79955),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'assets/images/Chef.gif',
              height: 250,
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    _buildIntro(),
                    Expanded(
                      child: _buildMenu(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildIntro() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Wolfy\'s',
            style: GoogleFonts.varelaRound(
              fontSize: 25,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'SERVING GOODNESS SINCE 1967',
            style: GoogleFonts.varelaRound(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: ColorConstants.primaryColor),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Wolfy\'s is located on Peterson near California. There is a certain joy driving down Peterson and seeig that iconic Wolfy\'s sign with the fork and lights.',
            style: GoogleFonts.varelaRound(
              fontSize: 15,
              fontWeight: FontWeight.w200,
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMenu() {
    return Container(
      child: DefaultTabController(
        length: data.length,
        child: Column(
          children: <Widget>[
            _buildTabBar(),
            Expanded(
              child: _buildTabBarView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return TabBar(
      labelColor: Colors.black,
      isScrollable: true,
      indicatorColor: ColorConstants.primaryColor,
      unselectedLabelColor: Colors.grey,
      labelStyle: GoogleFonts.varelaRound(fontWeight: FontWeight.w600),
      tabs: List.generate(
        data.length,
        (index) => Tab(
          text: data[index].name,
        ),
      ),
    );
  }

  _buildTabBarView() {
    return Container(
      child: TabBarView(
        children: List.generate(
          data.length,
          (index) {
            ///TabBarView children length = Number of categories
            ///Each category have foodList (ListView)
            return ListView.separated(
                padding: EdgeInsets.all(20),
                itemBuilder: (context, foodIndex) {
                  return FoodTile(
                    foodItem: data[index].foodList[foodIndex],
                  );
                },
                separatorBuilder: (context, foodIndex) {
                  return SizedBox(
                    height: 20,
                  );
                },
                itemCount: data[index].foodList.length);
          },
        ),
      ),
    );
  }
}
