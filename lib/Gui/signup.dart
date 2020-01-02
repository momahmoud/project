import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lostpeople/Gui/homePage.dart';
import 'package:lostpeople/Gui/login.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:math' as math;
import 'package:modal_progress_hud/modal_progress_hud.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> with SingleTickerProviderStateMixin {
  final auth = FirebaseAuth.instance;
  bool showSpinner = false;
  String email;
  String password;
  Animation<double> animation;
  AnimationController animController;
 @override
  void initState() {
    super.initState();
    getCurrentUser();
    animController = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    animation = Tween<double>(
      begin: 0,
      end: 2 * math.pi,
    ).animate(animController)
      ..addListener(() {
        // Empty setState because the updated value is already in the animation field
        setState(() {});
      });

    animController.forward();
  }
  FirebaseUser loggedInUser;
  void getCurrentUser() async{
    try{
      final user = await auth.currentUser();
      if(user != null){
        loggedInUser = user;
        print(loggedInUser.email);
      }
    }catch(e){
      print(e);
    }
  }
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        
              child: Container(
          decoration: BoxDecoration(
                   image: DecorationImage(
                      image: AssetImage("assets/pics/images5.jpg",
                      ),fit: BoxFit.cover
                    ),),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3.4,
                decoration: BoxDecoration(
                    // gradient: LinearGradient(
                    //   begin: Alignment.topCenter,
                    //   end: Alignment.bottomCenter,
                    //   colors: [
                    //     Colors.blue[900],
                    //     Colors.blue[500]
                    //     // Color(0xFFf45d27),
                    //     // Color(0xFFf5851f),
                    //   ],
                    // ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(80),
                    )),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Spacer(),
                    Align(
                      alignment: Alignment.center,
                      
                        child: Center(
                          child: Text(
                            "Create a new account",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: "ubuntu-Bold",
                              fontSize: 22,
                            ),
                    
                       ),
                        ),
                     
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20.0, bottom: 20),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "Ubuntu-Bold"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              
              
              Container(
                padding: EdgeInsets.only(left: 37, right: 37),
                width: 250,
                height: 50,
                child: Card(
                  elevation: 15,
                  child: TextField(
                    onChanged: (val){
                      email = val;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      
                      hintText: "Enter Your Email",
                      hintStyle:
                          TextStyle(fontSize: 16, fontFamily: "Ubuntu-Bold"),
                      prefixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.all(13),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                
                padding: EdgeInsets.only(left: 37, right: 37),
                width: 250,
                height: 50,
                child: Card(
                  elevation: 15,
                  child: TextField(
                    obscureText: true,
                    onChanged: (val){
                      password = val;
                    },
                    decoration: InputDecoration(
                      
                      suffixIcon: Icon(Icons.visibility_off),
                      hintStyle:
                          TextStyle(fontSize: 16, fontFamily: "Ubuntu-Bold"),
                      hintText: "Password",
                      prefixIcon: Icon(Icons.vpn_key),
                      contentPadding: EdgeInsets.all(13),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),

              // SizedBox(
              //   height: 10,
              // ),
              // Container(
                
              //   padding: EdgeInsets.only(left: 37, right: 37),
              //   width: 250,
              //   height: 50,
              //   child: Card(
              //     elevation: 15,
              //     child: TextFormField(
              //       decoration: InputDecoration(
              //         // suffixIcon: Icon(Icons.visibility_off),
              //         hintStyle:
              //             TextStyle(fontSize: 16, fontFamily: "Ubuntu-Bold"),
              //         hintText: "Confirm Password",
              //         prefixIcon: Icon(Icons.vpn_key),
              //         contentPadding: EdgeInsets.all(13),
              //         border: InputBorder.none,
              //       ),
              //     ),
              //   ),
              // ),
              // Align(
              //     alignment: Alignment.bottomRight,
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 8.0, right: 50),
              //       child: Text(
              //         "Forget Password ?",
              //         style: TextStyle(
              //             color: Colors.blue, fontFamily: "Ubuntu-Bold"),
              //       ),
              //     )),\
              SizedBox(height: 50,),
              Container(
                margin: EdgeInsets.only(top: 30, right: 30, left: 30),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.deepOrange[800],
                        Colors.deepOrange[700],
                         Colors.deepOrange[900]]),
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                padding: EdgeInsets.only(left: 37, right: 37),
                width: 250,
                height: 40,
                child: MaterialButton(
                  elevation: 30,
                  onPressed: () async{
                    setState(() {
                      showSpinner = true;
                    });
                    try{
                    final newUser = await auth.createUserWithEmailAndPassword(email: email, password: password);
                    if (newUser != null){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=> Login()
                      ));
                    }
                    setState(() {
                      showSpinner = false; 
                    });
                    }catch(e){
                      print(e);

                    }
                  },
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Ubuntu-Bold",
                        fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: <Widget>[
              //       Container(
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.all(Radius.circular(20))),
              //         height: 40,
              //         child: MaterialButton(
              //           elevation: 30,
              //           onPressed: () {},
              //           child: Center(
              //               child: Image.asset("assets/pics/facebook.png",fit: BoxFit.cover,)),
              //         ),
              //       ),
                    
              //       Text("or", style: TextStyle(
              //         color: Colors.black45,
              //         fontFamily: "ubuntu-Bold",
              //         fontWeight: FontWeight.bold
              //       ),),

              //       Container(
              //         decoration: BoxDecoration(
              //             borderRadius: BorderRadius.all(Radius.circular(20))),
              //         height: 40,
              //         child: MaterialButton(
              //           elevation: 30,
              //           onPressed: () {},
              //           child: Center(
              //               child: Image.asset(
              //             "assets/pics/search(1).png",
              //             fit: BoxFit.cover,
              //           )),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              
              SizedBox(
                height: MediaQuery.of(context).size.height/25,
              ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Row(
              //     children: <Widget>[
              //       Container(
                
              //   decoration: BoxDecoration(
              //       gradient: LinearGradient(
              //           colors: [Colors.blue[900], Colors.blue[500]]),
              //       borderRadius: BorderRadius.all(Radius.circular(40))),
              //   padding: EdgeInsets.only(left: 37, right: 37),
              //   width: 200,
              //   height: 40,
              //   child: MaterialButton(
              //     elevation: 30,
              //     onPressed: () {},
              //     child: Center(
              //       child: Text(
              //         "Sign up",
              //         style: TextStyle(
              //             color: Colors.white,
              //             fontFamily: "Ubuntu-Bold",
              //             fontSize: 20),
              //       ),
              //     ),
              //   ),
              // ),
              // // SizedBox(width: 40,),
              // // Expanded(
              // //               child: Container(
                  
              // //     decoration: BoxDecoration(
              // //         // gradient: LinearGradient(
              // //         //     colors: [Colors.blue[900], Colors.blue[500]]),
              // //         borderRadius: BorderRadius.all(Radius.circular(40))),
                 
              // //     width: 120,
              // //     height: 40,
              // //     child: MaterialButton(
              // //       elevation: 30,
              // //       onPressed: () {},
              // //       child: Center(
              // //         child: Row(
              // //           children: <Widget>[
              // //             Text(
              // //           "Skip",
              // //           style: TextStyle(
              // //               color: Colors.blue,
              // //               fontFamily: "Ubuntu-Bold",
              // //               fontWeight: FontWeight.bold,
              // //               fontSize: 22),
              // //         ),
              // //         Icon(Icons.arrow_forward_ios, size: 22, color: Colors.blue,),
                      
              // //           ],
              // //         )
              // //       ),
              // //     ),
              // //   ),
              // // ),
              //     ],
              //   ),
              // ),
              
            ],
          ),
        ),
      ),
    );
  }
}




