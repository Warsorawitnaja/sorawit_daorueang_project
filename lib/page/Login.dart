import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sorawit_daorueang_project/page/Fist.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var username = '';
  var password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/login2.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => HOME()),
                          );
                        },
                          child: Text(
                        "Skip   ",
                        style: GoogleFonts.sriracha(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.white),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "-LOGIN-",
                          style: GoogleFonts.sriracha(fontSize: 60 , fontWeight: FontWeight.bold , color: Colors.brown)
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/login3.png", height: 240),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("-Username-", style: GoogleFonts.sriracha(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.brown)),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white),
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      icon: Icon(Icons.person),
                      labelText: 'Username',
                    ),
                    onChanged: (value) {
                      username = value;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("-Password-", style: GoogleFonts.sriracha(fontSize: 20 , fontWeight: FontWeight.bold , color: Colors.brown)),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3, color: Colors.white),
                        //<-- SEE HERE
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      icon: Icon(Icons.lock),
                      labelText: 'Password',
                      suffixIcon: Icon(Icons.remove_red_eye),
                    ),
                    onChanged: (value) {
                      password = value;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    child: Text('     LOGIN     '),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown,
                    ),
                    onPressed: () {
                      if (username != '' && password != '') {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HOME()),
                        );
                      }
                      ;
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
/*

 */
