import 'package:flutter/material.dart';
import 'package:furniture/colors/color.dart';
import 'package:furniture/model/data.dart';
import 'package:furniture/ui/product_detail_page.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left:20.0, right:20 ),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ('Furniture'),
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      Icon(
                        LineIcons.heart,
                        size: 28,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        LineIcons.search,
                        size: 28,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      menus.length,
                      (index) => InkWell(
                            onTap: () {
                              setState(() {
                                activeIndex = index;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                    color: activeIndex == index
                                        ? primary
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: activeIndex == index
                                          ? Colors.transparent
                                          : primary,
                                    ),
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    menus[index],
                                    style: TextStyle(
                                        color: activeIndex == index
                                            ? white
                                            : primary,
                                        fontSize: 17),
                                  ),
                                ),
                              ),
                            ),
                          )),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Column(
                children: List.generate(
                    items.length,
                    (index) => InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductDetailPage(
                          id: items[index]['id'],
                          name: items[index]['name'],
                          img: items[index]['img'],
                          code: items[index]['code'],
                          pPrice: items[index]['p_price'].toString(),
                          pPromotionPrice: items[index]['p_promotion_price'].toString(),
                        )));
                      },
                      child: Card(
                            child: Row(
                              children: [
                                Hero(
                                  tag: items[index]['id'].toString(),
                                  child: Container(
                                    height: 120,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(items[index]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      items[index]['name'],
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          items[index]['p_promotion_price']
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 40,
                                        ),
                                        Text(
                                          items[index]['p_price'].toString() +
                                              " USD",
                                          style: TextStyle(
                                              fontSize: 17.0,
                                              color: warning,
                                              fontWeight: FontWeight.w500,
                                              decoration:
                                                  TextDecoration.lineThrough,decorationColor: Colors.black,),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
