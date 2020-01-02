import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:lostpeople/Gui/home.dart';
import 'package:lostpeople/Gui/signup.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math';
import 'package:modal_progress_hud/modal_progress_hud.dart';

enum AuthMode{Signup, Login}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  static const routeName = '/auth';
  final _auth = FirebaseAuth.instance;
  
  String email;
  String password;
  bool showSpinner = false;
  
  @override
  Widget build(BuildContext context) {
     final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      // body: Stack(
      //   children: <Widget>[
      //     Container(
      //       decoration: BoxDecoration(
      //         gradient: LinearGradient(
      //           colors: [
      //             Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
      //             Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
      //           ],
      //           begin: Alignment.topLeft,
      //           end: Alignment.bottomRight,
      //           stops: [0, 1],
      //         ),
      //       ),
      //     ),
      //     SingleChildScrollView(
      //       child: Container(
      //         height: deviceSize.height,
      //         width: deviceSize.width,
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: <Widget>[
      //             Flexible(
      //               child: Container(
      //                 margin: EdgeInsets.only(bottom: 20.0),
      //                 padding:
      //                     EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
      //                 transform: Matrix4.rotationZ(-8 * pi / 180)
      //                   ..translate(-10.0),
      //                 // ..translate(-10.0),
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(20),
      //                   color: Colors.deepOrange.shade900,
      //                   boxShadow: [
      //                     BoxShadow(
      //                       blurRadius: 8,
      //                       color: Colors.black26,
      //                       offset: Offset(0, 2),
      //                     )
      //                   ],
      //                 ),
      //                 child: Text(
      //                   'MyShop',
      //                   style: TextStyle(
      //                     color: Theme.of(context).accentTextTheme.title.color,
      //                     fontSize: 50,
      //                     fontFamily: 'Anton',
      //                     fontWeight: FontWeight.normal,
      //                   ),
      //                 ),
      //               ),
      //             ),
      //             Flexible(
      //               flex: deviceSize.width > 600 ? 2 : 1,
      //               child: AuthCard(),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    
      body: ModalProgressHUD(
        inAsyncCall: showSpinner ,
              child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/pics/images6.jpg",
                ),
                fit: BoxFit.cover),
          ),
          child: ListView(
            children: <Widget>[
             
              Container(
                margin: EdgeInsets.only(top: 0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5,
                decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage("assets/pics/images3.jpg")
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
                          "Sign in your account",
                          style: TextStyle(
                              fontSize: 22,
                              fontFamily: "ubuntu-Bold",
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Spacer(),
                   
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
                  color: Colors.transparent,
                  elevation: 15,
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value){
                      email = value;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      hintText: "Email",
                      hintStyle:
                          TextStyle(fontSize: 16, fontFamily: "Ubuntu-Bold"),
                      prefixIcon: Icon(Icons.email),
                      contentPadding: EdgeInsets.all(13),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))),
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
                  color: Colors.transparent,
                  child: TextField(
                    obscureText: true,
                    onChanged: (value){
                      password = value;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      hintStyle:
                          TextStyle(fontSize: 16, fontFamily: "Ubuntu-Bold"),
                      hintText: "Password",
                      prefixIcon: Icon(Icons.vpn_key),
                      contentPadding: EdgeInsets.all(13),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                    ),
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 50),
                    child: Text(
                      "Forget Password ?",
                      style: TextStyle(
                          color: Colors.blue, fontFamily: "Ubuntu-Bold"),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(top: 50, right: 30, left: 30),
                decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.white, Colors.white]),
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
                    final loginUser = await _auth.signInWithEmailAndPassword(
                      email: email,
                      password: password
                    );
                    if(loginUser != null){
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context)=>Home()
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
                    "Login",
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: "Ubuntu-Bold",
                        fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 40,
                      child: MaterialButton(
                        elevation: 30,
                        onPressed: () {},
                        child: Center(
                            child: Image.asset(
                          "assets/pics/facebook.png",
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                    Text(
                      "or",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "ubuntu-Bold",
                          fontWeight: FontWeight.bold),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      height: 40,
                      child: MaterialButton(
                        elevation: 30,
                        onPressed: () {},
                        child: Center(
                            child: Image.asset(
                          "assets/pics/search(1).png",
                          fit: BoxFit.cover,
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 28,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Colors.blue[900], Colors.blue[500]]),
                          borderRadius: BorderRadius.all(Radius.circular(40))),
                      padding: EdgeInsets.only(left: 37, right: 37),
                      width: 200,
                      height: 40,
                      child: MaterialButton(
                        elevation: 30,
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => SignUp()));
                        },
                        child: Center(
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: "Ubuntu-Bold",
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            // gradient: LinearGradient(
                            //     colors: [Colors.blue[900], Colors.blue[500]]),
                            borderRadius: BorderRadius.all(Radius.circular(40))),
                        width: 120,
                        height: 40,
                        child: MaterialButton(
                          elevation: 30,
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => Home()));
                          },
                          child: Center(
                              child: Row(
                            children: <Widget>[
                              Text(
                                "Skip",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Ubuntu-Bold",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 22,
                                color: Colors.white,
                              ),
                            ],
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20.0, right: 20),
              //   child: ClipPath(
              //    clipper: ClippingClassTwo(), 
              //     child: Card(
              //       elevation: 100,
              //       color: Colors.white,
              //       // shape: BeveledRectangleBorder(
              //       //     borderRadius: BorderRadius.only(
              //       //         topLeft: Radius.circular(25),
              //       //         )),
              //       child: Container(
              //         margin: EdgeInsets.only(left: 20, right: 200),
              //         height: 300,
              //         width: 50,
              //         // decoration: BoxDecoration(
              //         //     shape: BoxShape.BeveledRectangleBorder,
              //         //     color: Colors.white,
              //         //     borderRadius: BorderRadius.only(
              //         //         topLeft: Radius.circular(50),
              //         //         topRight: Radius.circular(1000))),
              //       ),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20.0, right: 20),
              //   child: ClipPath(
              //    clipper: ClippingClass(), 
              //     child: Card(
              //       elevation: 100,
              //       color: Colors.white,
              //       // shape: BeveledRectangleBorder(
              //       //     borderRadius: BorderRadius.only(
              //       //         topLeft: Radius.circular(25),
              //       //         )),
              //       child: Container(
              //         margin: EdgeInsets.only(left: 20, right: 200),
              //         height: 150,
              //         width: 50,
              //         // decoration: BoxDecoration(
              //         //     shape: BoxShape.BeveledRectangleBorder,
              //         //     color: Colors.white,
              //         //     borderRadius: BorderRadius.only(
              //         //         topLeft: Radius.circular(50),
              //         //         topRight: Radius.circular(1000))),
              //       ),
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
     );
  }
}
class AuthCard extends StatefulWidget {
  const AuthCard({
    Key key,
  }) : super(key: key);

  @override
  _AuthCardState createState() => _AuthCardState();
}

class _AuthCardState extends State<AuthCard> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  final _passwordController = TextEditingController();

  void _submit() {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_authMode == AuthMode.Login) {
      // Log user in
    } else {
      // Sign user up
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: Container(
        height: _authMode == AuthMode.Signup ? 320 : 260,
        constraints:
            BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 320 : 260),
        width: deviceSize.width * 0.75,
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-Mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                  },
                  onSaved: (value) {
                    _authData['email'] = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value;
                  },
                ),
                // if(_authMode == AuthMode.Signup)
                  
                  TextFormField(
                    enabled: _authMode == AuthMode.Signup,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: _authMode == AuthMode.Signup
                        ? (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match!';
                            }
                          }
                        : null,
                  ),
                SizedBox(
                  height: 20,
                ),
                // if(_isLoading)
                //   CircularProgressIndicator()
                // else
                  RaisedButton(
                    child:
                        Text(_authMode == AuthMode.Login ? 'LOGIN' : 'SIGN UP'),
                    onPressed: _submit,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
                    color: Theme.of(context).primaryColor,
                    textColor: Theme.of(context).primaryTextTheme.button.color,
                  ),
                FlatButton(
                  child: Text(
                      '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                  onPressed: _switchAuthMode,
                  padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  textColor: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClippingClassTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);
    var secondEndPoint = Offset(size.width, size.height - 40);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();

     
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) =>false;

}
class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
   var path = Path();
    path.lineTo(0.0, size.height);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    // var secondControlPoint =
    //     Offset(size.width - (size.width / 3.25), size.height - 65);
    // var secondEndPoint = Offset(size.width, size.height - 40);
    // path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
    //     secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height-100);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) =>false;

}