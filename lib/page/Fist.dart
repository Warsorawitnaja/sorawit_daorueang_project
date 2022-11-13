import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:sorawit_daorueang_project/models/Food.dart';
import 'package:sorawit_daorueang_project/page/Login.dart';
import 'package:sorawit_daorueang_project/page/food_page.dart';

var foodList = [
  Food(
    name: "ชานมไข่มุก",
    price: 40,
    imageUrl: 'cn_2.png',
    powder: 'ผงชา 1 ช้อนชา',
    water: 'น้ำเดือด8ออนซ์   ',
    sugar: 'น้ำตาลทราย เล็กน้อย',
    ice: 'น้ำแข็ง',
    jelly: 'ไข่มุกต้มสุก 1/4 ถ้วย',
    milke: 'นมสด ตามชอบ',
    step1: '1. แช่ผงชากับน้ำร้อนไว้ประมาณ 5 นาที พอครบเวลากรองเอาชาออก',
    step2: '2. เติมน้ำตาลทรายลงไปตามชอบ คนให้ละลายแล้วพักทิ้งไว้จนเย็น',
    step3: '3. ตักไข่มุกใส่แก้ว ตามด้วยน้ำแข็ง เทน้ำชาที่เย็นแล้วลงไป',
    cal: '360 kcal',
  ),
  Food(
    name: 'ชาเขียวไข่มุก',
    price: 45,
    imageUrl: 'greencha.png',
    powder: ' ผงชาเขียวมัทฉะ 1 ช้อนชา',
    water: 'น้ำร้อน 2 ช้อนโต๊ะ',
    sugar: 'น้ำตาลทราย เล็กน้อย',
    ice: 'น้ำแข็ง 1/2 ถ้วย',
    jelly: 'ไข่มุกต้มสุก 1/4 ถ้วย',
    milke: 'นมสด 1 ถ้วย',
    step1:
        '1. ละลายผงชาเขียวกับน้ำร้อนเข้าด้วยกัน ใส่ลงในเชคเกอร์ ตามด้วยน้ำผึ้งนมสด และน้ำแข็ง เขย่าผสมให้เข้ากันดี',
    step2:
        '2. ตักไข่มุกใส่แก้ว เทส่วนผสมชาเขียวลงไป ตามด้วยไอศกรีมชาเขียว พร้อมเสิร์ฟ',
    step3: '',
    cal: '360 kcal',
  ),
  Food(
    name: 'ชาโกโก้ไข่มุก   ',
    price: 50,
    imageUrl: 'cooo.png',
    powder: 'ผงโกโก้ 1 ช้อนโต๊ะ',
    water: 'น้ำร้อน 20 มิลลิลิตร',
    sugar: 'น้ำตาลทราย เล็กน้อย',
    ice: 'น้ำแข็ง 1/2 ถ้วย',
    jelly: 'ไข่มุกต้มสุก 1/4 ถ้วย',
    milke: 'นมสด 100 มิลลิลิตร',
    step1: '1. เทน้ำร้อนลงในถ้วยตวง  จากนั้นใส่โกโก้แล้วคนให้ละลาย',
    step2: '2. เติมน้ำตาลทราย  คนให้ละลาย  จากนั้นเติมนมข้นหวานและคนจนเข้ากัน',
    step3: '3. เติมนมสด',
    cal: '334 kcal',
  ),
  Food(
    name: 'ชาไทย',
    price: 35,
    imageUrl: 'chath1.png',
    powder: 'ผงชา 1 ช้อนชา',
    water: 'น้ำร้อน 20 มิลลิลิตร',
    sugar: 'น้ำตาลทราย เล็กน้อย',
    ice: 'น้ำแข็ง 1/2 ถ้วย',
    jelly: '',
    milke: 'นมสด 100 มิลลิลิตร',
    step1:
        '1. ตักใบชาใส่ก้านชง นำเข้าเครื่องชงแล้วทำการพักชา 20 วิ แล้วกดน้ำชาให้ได้ปริมาณ 100 มิลลิลิตร',
    step2:
        '2. เสร็จแล้วให้เติมครีมเทียม คนให้ละลายจนหมด แล้วให้เติมนมข้นหวาน นมสด คนให้เข้ากันอีกครั้ง',
    step3: '3. ตักน้ำแข็งใส่ในแก้ว แล้วให้เทชาไทยลงไป เป็นอันเสร็จ',
    cal: '319 kcal',
  ),
  Food(
    name: 'กาแฟเย็น',
    price: 40,
    imageUrl: 'coffeice.png',
    powder: 'ผงชา 1 ช้อนชา',
    water: 'น้ำร้อน 20 มิลลิลิตร',
    sugar: 'น้ำตาลทราย เล็กน้อย',
    ice: 'น้ำแข็ง 1/2 ถ้วย',
    jelly: '',
    milke: 'นมผสม 1.5 oz (45 ml)',
    step1:
        '1. ใส่ผงกาแฟลงในขวด กระบอกเชคเกอร์ หรือภาชนะอะไรก็ได้ที่ขนาดไม่ใหญ่มาก และสามารถปิดฝาได้สนิท',
    step2:
        '2. ใส่น้ำตาลทราย เติมน้ำ (น้ำอุณหภูมิห้อง น้ำเย็น น้ำอุ่น หรือน้ำร้อน ก็ได้) เขย่าจนเป็นฟอง',
    step3: '',
    cal: '317 kcal',
  ),
  Food(
    name: 'ชาดำเย็น',
    price: 60,
    imageUrl: 'charblackice.png',
    powder: 'น้ำชาที่ชงแล้ว 3/4 แก้ว',
    water: 'น้ำตาลทราย 3 ช้อนโต๊ะ',
    sugar: 'น้ำตาลทราย เล็กน้อย',
    ice: 'น้ำแข็ง 1/2 ถ้วย',
    jelly: '',
    milke: '',
    step1:
        '1. เทผงชาทั้งสองชนิดลงในแก้วกรองชา เทน้ำร้อนจัดลงไป ใช้ช้อนตีผสมแล้วพักทิ้งไว้ 2-5 นาที',
    step2: '2. กรองน้ำชาใส่ถ้วย เทน้ำตาลทรายลงไป',
    step3:
        '3. ชงจนน้ำตาลละลายดี เทใส่แก้วที่มีน้ำแข็งเตรียมไว้ เท่านี้ก็เรียบร้อย ดื่มเย็น ๆ ชื่นใจนักแล',
    cal: '317 kcal',
  ),
  Food(
    name: 'นมเย็น',
    price: 40,
    imageUrl: 'nomice.png',
    powder: 'น้ำหวานกลิ่นสละ 2 ช้อนโต๊ะ',
    water: 'น้ำร้อน 3/4 แก้ว',
    sugar: 'นมข้นหวาน 2 ช้อนชา',
    ice: 'น้ำแข็ง',
    jelly: '',
    milke: 'นมข้นจืด (โรยหน้า)',
    step1:
        '1. นำนมสดรสจืด มาผสมกับน้ำเชื่อมเข้มข้นสีแดง และนมข้นหวาน ผสมให้ทุกอย่างละลายเข้ากันดี',
    step2: '2. เทนมเย็นใส่แก้วที่เติมน้ำแข็งไว้',
    step3:
        '3. และเพิ่มความมันด้วยการโรยนมข้นจืดด้านบน เพียงเท่านี้ “นมเย็น-นมชมพู” ก็พร้อมเสิร์ฟแล้วค่า',
    cal: '425 kcal',
  ),
  Food(
    name: 'โอเลี้ยง',
    price: 30,
    imageUrl: 'oooo.png',
    powder: 'ผงโอเลี้ยง 5-6 ช้อนโต๊ะ',
    water: 'น้ำ 1+1/2 ถ้วย',
    sugar: 'น้ำตาลทราย 10 ช้อนโต๊ะ',
    ice: 'น้ำแข็ง',
    jelly: '',
    milke: '',
    step1:
        '1. ตัก เนสกาแฟเรดคัพ กดน้ำร้อนให้ได้ ระดับขีด 1/2 ถ้วยตวง คนให้ละลาย',
    step2:
        '2. เติมน้ำตาลทรายลงแก้วชงคนให้ละลาย เติมน้ำร้อนเพิ่มให้ได้ระดับขีดที่ 3/4 ถ้วยตวง คนให้พอเข้ากัน',
    step3:
        '3. ตักน้ำแข็งลงแก้วเสิร์ฟ ใส่ส่วนผสมที่ชงไว้ลงไป โรยด้วยนมข้นจืด พร้อมเสิร์ฟทันทีขณะเย็น',
    cal: '103 kcal',
  ),
  Food(
    name: 'ชามะนาว',
    price: 35,
    imageUrl: 'lamon.png',
    powder: 'ผงมะนาว 1/2 ช้อนโต๊ะ',
    water: 'น้ำร้อน 20 มิลลิลิตร',
    sugar: 'น้ำเชื่อม 30 มิลลิลิตร',
    ice: 'น้ำแข็ง 1/2 ถ้วย',
    jelly: '',
    milke: 'น้ำมะนาว 15 มิลลิลิตร',
    step1: '1. ใส่ผงชาในถุงชงชาตามด้วยน้ำร้อน ชงจนน้ำชามีความเข้มข้น',
    step2:
        '2. เทใส่เหยือก ใส่น้ำตาล เกลือ และน้ำมะนาว คนจนน้ำตาลละลายเข้า พักไว้ให้เย็น',
    step3: '3.  รินใส่แก้วน้ำแข็ง ตกแต่งด้วยมะนาวหั่นแว่น เสิร์ฟ',
    cal: '100 kcal',
  ),
];

var feedd =  0;
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HOME(),
      debugShowCheckedModeBanner: false,
    );
  }
}

Widget buildhome() {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bkhome2.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, i) {
          var food = foodList[i];

          /// รายการอาหารใน List ของเรา
          return Card(
            color: Colors.white60,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodPage(
                            food: food,
                          )),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    //Icon(Icons.fastfood, size: 50.0,),
                    Image.asset(
                      "assets/images/${food.imageUrl}",
                      width: 100.0,
                      height: 100.0,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                food.name,
                                style: GoogleFonts.sriracha(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.brown),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(food.cal , style: GoogleFonts.sriracha(fontSize: 18 , fontWeight: FontWeight.bold , color: Colors.brown) )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.navigate_next , size: 30),
                  ],
                ),
              ),
            ),
          );
        },
        itemCount: foodList.length,
      ),
    ),

    /// ส่งฟังชันไห้ builder
    ///
  );
}

Widget buildFeed() {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bkhome2.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(children: [
        SizedBox(height: 20,),
        Container(
          height: 220,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Colors.grey.shade400, Colors.brown.shade300]
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/apple.png", height: 150),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("แอปเปื้ลโซดา", style: GoogleFonts.sriracha(fontSize: 30 , fontWeight: FontWeight.bold , color: Colors.brown)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Colors.grey.shade400, Colors.brown.shade300]
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/blue.png", height: 150),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("บลูฮาวายโซดา", style: GoogleFonts.sriracha(fontSize: 30 , fontWeight: FontWeight.bold , color: Colors.brown)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Colors.grey.shade400, Colors.brown.shade300]
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/vava.png", height: 150),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("สตอเบอรี่โซดา", style: GoogleFonts.sriracha(fontSize: 30 , fontWeight: FontWeight.bold , color: Colors.brown)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.topRight,
                colors: [Colors.grey.shade400, Colors.brown.shade300]
            ),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/images/malon.png", height: 150),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("แตงโมโซดา", style: GoogleFonts.sriracha(fontSize: 30 , fontWeight: FontWeight.bold , color: Colors.brown)),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
      ]),
    ),
  );
}

Widget buildProfile() {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bkhome2.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/asd.png"),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Sorawit Daorueang",
                style: GoogleFonts.bebasNeue(
                  fontSize: 50.0,
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [Colors.grey.shade400, Colors.brown.shade300]
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 100,
                      width: 100,
                      //color: Colors.white38,
                      child: Row(
                        children: [
                          Image.asset("assets/images/fbb.png"),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "WarSorawit",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 40.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [Colors.grey.shade400, Colors.brown.shade300]
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 100,
                      width: 100,
                      //color: Colors.white38,
                      child: Row(
                        children: [
                          Image.asset("assets/images/ig.png"),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "war_sorawit13",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 40.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [Colors.grey.shade400, Colors.brown.shade300]
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      height: 100,
                      width: 100,
                      //color: Colors.white38,
                      child: Row(
                        children: [
                          Image.asset("assets/images/yout.png"),
                          SizedBox(
                            width: 15,
                          ),
                          Text(
                            "SORAWIT DAORUEANG",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 40.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    ),
  );
}

Widget buildSettings(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bkhome2.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [Colors.grey.shade400, Colors.brown.shade300]
                        ),
                        //borderRadius: BorderRadius.circular(15),
                      ),
                      width: 100,
                      height: 100,
                      //color: Colors.white38,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginForm()),
                              );
                            },
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.black12,
                                  radius: 50,
                                  backgroundImage: AssetImage("assets/images/logoice.png"),
                                ),
                                SizedBox(width: 15,),
                                Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Text("เข้าสู่ระบบ" , style: GoogleFonts.sriracha(fontSize: 25 , fontWeight: FontWeight.bold , color: Colors.brown)),
                                    Text("ดูสูตรเมนูน้ำต่างๆ รูปภาพเพิ่มเติม " , style: GoogleFonts.sriracha(fontSize: 18 , fontWeight: FontWeight.bold , color: Colors.brown)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                            colors: [Colors.grey.shade400, Colors.brown.shade300]
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 100,
                      height: 300,
                     // color: Colors.white38,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: 20,),
                              Text("เร็วนี้ๆ" , style: GoogleFonts.sriracha(fontSize: 60 , fontWeight: FontWeight.bold , color: Colors.brown)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    ),
  );
}

class HOME extends StatefulWidget {
  const HOME({Key? key}) : super(key: key);

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Mul",
              style: GoogleFonts.pacifico(
                fontSize: 45,
              )),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: (){
                feedd = 1;
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => buildFeed()),
                );
              },
              icon: Stack(
                children: [
                  Icon(Icons.notifications, size: 30 ),
                  Positioned(
                    right: 16.0,
                    child: Icon(Icons.brightness_1 , color: Colors.red , size: 15.0),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                size: 30,
              ),
              onPressed: () {},
            )
          ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(
                'https://i.pinimg.com/564x/9b/78/26/9b78264fb830959347e440a46c79e49b.jpg',
              ),
              fit: BoxFit.cover,
            )),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home, color: Colors.brown),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.campaign_sharp, color: Colors.brown),
                text: 'News',
              ),
              Tab(
                icon: Icon(Icons.person, color: Colors.brown),
                text: 'Profile',
              ),
              Tab(
                icon: Icon(Icons.settings, color: Colors.brown),
                text: 'Settings',
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  //color: Colors.brown.shade300,
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.topRight,
                      colors: [Colors.grey.shade400, Colors.brown.shade300]
                  ),
                ),
                accountName: Text("Mr. Sorawit Daorueang" , style: TextStyle(fontWeight: FontWeight.bold ,fontSize: 20)),
                accountEmail: Text("630710774" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20)),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/logoice.png"),
                  backgroundColor: Colors.white,
                ),
              ),
              ListTile(
                title: Text("Home" , style: GoogleFonts.sriracha(fontSize: 25 , fontWeight: FontWeight.bold , color: Colors.brown)),
                trailing: Icon(Icons.home),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HOME())),
              ),
              ListTile(
                title: Text("News" , style: GoogleFonts.sriracha(fontSize: 25 , fontWeight: FontWeight.bold , color: Colors.brown)),
                trailing: Icon(Icons.campaign_sharp),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => buildFeed())),
              ),
              ListTile(
                title: Text("Profile" , style: GoogleFonts.sriracha(fontSize: 25 , fontWeight: FontWeight.bold , color: Colors.brown)),
                trailing: Icon(Icons.person),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => buildProfile())),
              ),
              ListTile(
                title: Text("Settings" , style: GoogleFonts.sriracha(fontSize: 25 , fontWeight: FontWeight.bold , color: Colors.brown)),
                trailing: Icon(Icons.settings),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => buildSettings(context))),
              ),
              SizedBox(height: 35,),
              Image.asset("assets/images/login3.png", height: 250),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildhome(),
            buildFeed(),
            buildProfile(),
            buildSettings(context),
          ],
        ),
      ),
    );
  }
}
