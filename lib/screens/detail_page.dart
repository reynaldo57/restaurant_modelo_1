import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_modelo_1/screens/home_page.dart';

class DetailPage extends StatelessWidget {
  Map<String, dynamic>? product;
  DetailPage({this.product});

  static var screenHeight;
  static var screenWidth;
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff0c0f14),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            this.product!["image"],
                          ),
                        ),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30.0),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(
                                sigmaX: 10.0,
                                sigmaY: 10.0,
                              ),
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                width: double.infinity,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Color(0xff311d18).withOpacity(0.6),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    this.product!["name"],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20.0,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 3,
                                                  ),
                                                  Text(
                                                    this.product![
                                                        "description"],
                                                    style: TextStyle(
                                                      fontSize: 10.0,
                                                      color: Color(0xffaeaeae),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: Color(
                                                      0xffd17842,
                                                    ),
                                                  ),
                                                  Text(
                                                    this
                                                        .product!["rate"]
                                                        .toStringAsFixed(1),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    height: 40.0,
                                                    width: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff141921),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10.0,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'images/coffeeicon.svg',
                                                          height: 20,
                                                          color:
                                                              Color(0xffd17842),
                                                        ),
                                                        Text(
                                                          "Coffee",
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: Color(
                                                                0xffaeaeae),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 40.0,
                                                    width: 40.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xff141921),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10.0,
                                                      ),
                                                    ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: [
                                                        SvgPicture.asset(
                                                          'images/milkicon.svg',
                                                          height: 20,
                                                          color:
                                                              Color(0xffd17842),
                                                        ),
                                                        Text(
                                                          "Milk",
                                                          style: TextStyle(
                                                            fontSize: 10,
                                                            color: Color(
                                                                0xffaeaeae),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              MaterialButton(
                                                minWidth: 120,
                                                onPressed: () {},
                                                color: Color(0xff101419),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                    10.0,
                                                  ),
                                                ),
                                                child: Text(
                                                  "Medicum Roasted",
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    color: Color(0xffaeaeae),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              color: Color(0xff141921),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: IconButton(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              icon: Icon(
                                Icons.arrow_back_ios_new,
                                size: 20,
                                color: Color(0xffaeaeae),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: BoxDecoration(
                              color: Color(0xff141921),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.favorite,
                                size: 20,
                                color: Color(0xffaeaeae),
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Text(
                      "Ingredientes Principlaes",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.only(right: 220),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: this.product!["ingredients"].map<Widget>((item)=>Text(
                    "- $item",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),).toList(),
                ),
              ),

              SizedBox(
                height: 140,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Price",
                        style: TextStyle(
                          color: Color(0xffaeaeae),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          Text(
                            "\$\t",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xffd17842),
                            ),
                          ),
                          Text(
                            "S/. ${this.product!["price"].toStringAsFixed(2)}",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  MaterialButton(
                    onPressed: () {},
                    height: 55,
                    minWidth: 200,
                    color: Color(0xffd17842),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Text(
                      "Buy Now",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
