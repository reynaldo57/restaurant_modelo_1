import 'package:flutter/material.dart';
import 'package:restaurant_modelo_1/screens/detail_page.dart';
import 'package:restaurant_modelo_1/services/firestore_service.dart';
import 'package:restaurant_modelo_1/utils/search_product.dart';

class HomePage extends StatelessWidget {


  
  
  FirestoreService _productFirestoreService = new FirestoreService(collection: 'products');
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      "Finds the Best",
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
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 10),
                padding:
                EdgeInsets.symmetric(horizontal: 50),
                height: 54,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 50,
                      color: Colors.deepOrangeAccent,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "search",
                          hintStyle: TextStyle(
                            color: Colors.blue,
                          ),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    //SvgPicture.asset("assets/icons/search.svg"),
                    IconButton(
                        onPressed: () async {
                          final result = await showSearch(
                              context: context,
                              delegate: SearchProduct(
                                  listProducts:
                                  await _productFirestoreService
                                      .getAllProducts()));
                        },
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                    )
                  ],
                ),
              ),

              FutureBuilder(
                  future: _productFirestoreService.getProductHome(categoryId: "PH0REIrqVbYaLQurQGkC"),
                  builder: (BuildContext context, AsyncSnapshot snap){
                    if(snap.hasData){
                      List<Map<String, dynamic>> products = snap.data;
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: products.map<Widget>((e)=> GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(product: e,)));
                              },
                              child: Container(
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
                                                  image: NetworkImage(
                                                      e["image"],
                                                  ),
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
                                                  e["name"],
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3.0,
                                                ),
                                                Text(
                                                  e["description"],
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
                                                          e["price"].toStringAsFixed(2),
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Color(0xffd17842)),
                                                        ),
                                                        Text(
                                                          e["rate"].toStringAsFixed(1),
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                            ),).toList()
                          ),
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator(),);

                  }
              ),
              FutureBuilder(
                  future: _productFirestoreService.getProductHome(categoryId: "i1Jz5VzH3h5UPdPZaofm"),
                  builder: (BuildContext context, AsyncSnapshot snap){
                    if(snap.hasData){
                      List<Map<String, dynamic>> products = snap.data;
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                        child: SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: products.map<Widget>((e)=> Container(
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
                                                  image: NetworkImage(
                                                    e["image"],
                                                  ),
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
                                                  e["name"],
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3.0,
                                                ),
                                                Text(
                                                  e["description"],
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
                                                          e["price"].toStringAsFixed(2),
                                                          style: TextStyle(
                                                              fontWeight:
                                                              FontWeight.bold,
                                                              color: Color(0xffd17842)),
                                                        ),
                                                        Text(
                                                          e["rate"].toStringAsFixed(1),
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
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                              ),).toList()
                          ),
                        ),
                      );
                    }
                    return Center(child: CircularProgressIndicator(),);

                  }
              ),
            ],
          ),
        ),
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
          unselectedItemColor: Color(0xff4e5053),
          selectedItemColor: Color(0xffd17842),
        ),
      ),
    );
  }
}
