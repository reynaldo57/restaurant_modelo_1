import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Widget buildCoffeCategory({categoryName, isSelected}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20),
    child: Column(
      children: [
        Text(
          categoryName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Color(0xffd17842) : Color(0xff52555a),
          ),
        ),
        isSelected
            ? Text(
                ".",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xffd17842),
                ),
              )
            : Text("")
      ],
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static List<Widget> _widgetOption = <Widget>[
    // HomePage(),

    Scaffold(
      backgroundColor: Color(0xff0c0f14),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xff141921),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Icon(
                        Icons.grid_view_rounded,
                        color: Color(0xFFFAFAFA),
                        size: 20,
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Color(0xff141921),
                          borderRadius: BorderRadius.circular(10.0),
                          image: DecorationImage(
                              image: AssetImage("assets/images/logo.png"))),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Fins the Best",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "Coffe for You",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xff52555a),
                    ),
                    hintText: "Find Your Coffee",
                    hintStyle: TextStyle(
                      color: Color(0xff52555a),
                    ),
                    fillColor: Color(0xff141921),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildCoffeCategory(
                        categoryName: "capuccino", isSelected: true),
                    buildCoffeCategory(
                        categoryName: "Latte", isSelected: false),
                    buildCoffeCategory(
                        categoryName: "Expresso", isSelected: false),
                    buildCoffeCategory(
                        categoryName: "capuccino", isSelected: false),
                  ],
                ),
              ),
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      margin: EdgeInsets.all(15.0),
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6.0,
                                          spreadRadius: 1.0,
                                          color: Color(0xff30221f),
                                        ),
                                      ],
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/images/ceviche.jpg"),
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "ceviche",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3.0,
                                      ),
                                      Text(
                                        "Con Leche de Tigre",
                                        style: TextStyle(
                                          color: Color(0xffaeaeae),
                                          fontSize: 10,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "\$\t",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffd17842)),
                                              ),
                                              Text(
                                                "45",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 20.0,
                            width: 55.0,
                            decoration: BoxDecoration(
                              color: Color(0xff231715),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(15.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 12.0,
                                  color: Color(0xffd17842),
                                ),
                                Text(
                                  "45",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: 200,
                      height: 200,
                      margin: EdgeInsets.all(15.0),
                      padding: EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAFAFA),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 6.0,
                                          spreadRadius: 1.0,
                                          color: Color(0xff30221f),
                                        ),
                                      ],
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            "assets/images/ceviche.jpg"),
                                      ),
                                      borderRadius:
                                      BorderRadius.circular(20.0)),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "ceviche",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3.0,
                                      ),
                                      Text(
                                        "Con Leche de Tigre",
                                        style: TextStyle(
                                          color: Color(0xffaeaeae),
                                          fontSize: 10,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "\$\t",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xffd17842)),
                                              ),
                                              Text(
                                                "45",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          Container(
                            height: 20.0,
                            width: 55.0,
                            decoration: BoxDecoration(
                              color: Color(0xff231715),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20.0),
                                bottomLeft: Radius.circular(15.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 12.0,
                                  color: Color(0xffd17842),
                                ),
                                Text(
                                  "45",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),

    Text(
      "Page1",
      style: optionStyle,
    ),
    Text(
      "Page2",
      style: optionStyle,
    ),
    Text(
      "Page9",
      style: optionStyle,
    ),
    Text(
      "Page4",
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0c0f14),
      body: Center(
        child: _widgetOption.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: SizedBox(
        height: 70,
        child: BottomNavigationBar(
          elevation: 0.0,
          backgroundColor: Color(0xff0c0f14),
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shop_rounded,
                size: 30,
              ),
              label: "Business",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                size: 30,
              ),
              label: "favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 30,
              ),
              label: "notifications",
            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Color(0xff4e5053),
          selectedItemColor: Color(0xffd17842),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
