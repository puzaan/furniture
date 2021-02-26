import 'package:flutter/material.dart';
import 'package:furniture/colors/color.dart';
import 'package:furniture/model/data.dart';
import 'package:furniture/ui/home_page.dart';
import 'package:line_icons/line_icons.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ProductDetailPage extends StatefulWidget {
  final int id;
  final String name;
  final String img;
  final code;
  final String pPrice;
  final String pPromotionPrice;
  ProductDetailPage(
      {this.id,
      this.name,
      this.img,
      this.code,
      this.pPrice,
      this.pPromotionPrice});
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quality = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 20),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.arrow_back_ios)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Hero(
              tag: widget.id.toString(),
              child: Container(
                height: 400,
                width: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.img), fit: BoxFit.cover),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Text(
                    'Name:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Text(
                    'Code:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    widget.code,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Text(
                    'Price:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  SizedBox(
                    width: 20,),
                  Row(
                    children: [
                      Text(
                        widget.pPromotionPrice + "USD",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        widget.pPrice,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                          color: warning,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Color:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Wrap(
                      children: List.generate(
                          colors.length,
                          (index) => Padding(
                                padding: const EdgeInsets.only(
                                    right: 10.0, bottom: 20),
                                child: Container(
                                  height: 25.0,
                                  width: 25.0,
                                  decoration: BoxDecoration(
                                      color: colors[index],
                                      shape: BoxShape.circle),
                                ),
                              )),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                children: [
                  Text(
                    'Quantity:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                    onTap: () {
                      if (quality > 1) {
                        setState(() {
                          quality--;
                        });
                      }
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          shape: BoxShape.circle),
                      child: Icon(
                        LineIcons.minus,
                        size: 15,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    quality.toString(),
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        quality++;
                      });
                    },
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          shape: BoxShape.circle),
                      child: Icon(
                        LineIcons.plus,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            InkWell(
              onTap: () {
                _onBasicAlertPressed(context);
              },
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20, bottom: 20),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: primary, borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(
                        color: white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  _onBasicAlertPressed(context) {
    Alert(
        context: context,
        title: "$quality piece of ${widget.name} is added ",
        desc: "Thank you for Purchase!!!!!",
        buttons: [
          DialogButton(
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomePage())),
            child: Text(
              "ok",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]
    ).show();
  }
}
