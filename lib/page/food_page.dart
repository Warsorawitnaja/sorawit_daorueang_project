import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sorawit_daorueang_project/models/Food.dart';
import 'package:sorawit_daorueang_project/page/Fist.dart';

class FoodPage extends StatelessWidget {
  final Food food;

  const FoodPage({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text(food.name)),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bbb2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HOME()),
                        );
                      },
                      icon: Icon(Icons.arrow_circle_left , size: 35 , color: Colors.brown ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 2.0,
                      child: Image.asset(
                        'assets/images/${food.imageUrl}',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(food.name , style: GoogleFonts.sriracha(fontSize: 25 , fontWeight: FontWeight.bold , color: Colors.brown))
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.grey,
                        height: 6,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 700,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.topRight,
                              colors: [Colors.grey.shade400, Colors.brown.shade300]
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        margin: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "-INGREDIENT-",
                                  style: GoogleFonts.sriracha(fontSize: 40 , fontWeight: FontWeight.bold , color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(food.powder, style: GoogleFonts.sriracha(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.brown)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(food.water,style: GoogleFonts.sriracha(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.brown)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(food.sugar, style: GoogleFonts.sriracha(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.brown)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(food.jelly, style: GoogleFonts.sriracha(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.brown)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(food.ice, style: GoogleFonts.sriracha(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.brown)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(food.milke, style: GoogleFonts.sriracha(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.brown)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "  -Procedure 🧾-",
                                  style: GoogleFonts.sriracha(fontSize: 40 , fontWeight: FontWeight.bold , color: Colors.white),
                                ),
                              ],
                            ),
                            Container(
                              child: Align(
                                child: Text(food.step1 , style: GoogleFonts.sriracha(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.brown)),
                              ),
                            ),
                            Container(
                              child: Align(
                                child: Text(food.step2 , style: GoogleFonts.sriracha(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.brown)),
                              ),
                            ),
                            Container(
                              child: Align(
                                child: Text(food.step3 , style: GoogleFonts.sriracha(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.brown)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}