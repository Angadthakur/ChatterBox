import 'package:chatter_box/pages/home.dart';
import 'package:chatter_box/pages/login.dart';
import 'package:chatter_box/service/database.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
//User to signup in the app and move to the home page.
  String name = "";
  String email = "";
  String password = "";
  String confirmPassword = "";

  TextEditingController namecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController confirmPasswordcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

//When the user clicks on signUp button , we will call the registration function & allow the user to signUp
  registration() async {
    if (password != null && password == confirmPassword) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);

        //Provide some random ID to user to track user detail in firebase.
        String ID = randomAlphaNumeric(10);

        Map<String, dynamic> userInfoMap = {
          "Name": namecontroller.text,
          "E-mail": emailcontroller.text,
          "username": emailcontroller.text.replaceAll("@gmail.com", ""),
          "Photo": "https://cdn-icons-png.flaticon.com/512/4202/4202841.png",
          "ID": ID,
        };

        await DatabaseMethods().addUserDetails(
            userInfoMap, ID); // Upload the data to firebse firestore.

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
          "Registered Successfully",
          style: TextStyle(fontSize: 20.0),
        )));

        //Using pushreplacement instead of push because if we go back from home page then it won't go back to the sign up page which will happen in push.
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'Weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Password provided is too weak",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.orangeAccent,
              content: Text(
                "Account already exists ",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset:
            true, // Ensures the layout adjusts when the keyboard appears
        body: SingleChildScrollView(
          // Allows content to scroll when needed
          child: Container(
            child: Stack(
              children: [
                Container(
                    //height: 30.5.h,
                    height: Adaptive.sp(65.5),
                    //height: MediaQuery.of(context).size.height /3.7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Color(0xFF4FC3F7), Color(0xFFB388FF)],
                        ),
                        borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(
                                MediaQuery.of(context).size.width, 105.0)))),
                Padding(
                  padding: const EdgeInsets.only(top: 40), //70
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          'Create your account!!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),

                      //SizedBox(height: 10.0),

                      Container(
                        margin: EdgeInsets.symmetric(
                            vertical: 25.0, horizontal: 20.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15.0, horizontal: 20.0),
                            //height: MediaQuery.of(context).size.height/1.5,  // 1.5
                            width: MediaQuery.of(context).size.width,
                            height: Adaptive.sp(100),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),

                            child: Form(
                              key: _formkey,
                              child: Column(
                                //crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15, //20
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.0,
                                          //color: Colors.black38,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextFormField(
                                      controller: namecontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter your name";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter name',
                                          prefixIcon:
                                              Icon(Icons.person_2_outlined)),
                                    ),
                                  ),

                                  SizedBox(height: 15), //25

                                  Text(
                                    'Email',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.0,
                                          //color: Colors.black38,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextFormField(
                                      controller: emailcontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter your Email ID";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter email ID',
                                          prefixIcon: Icon(Icons.mail_outline)),
                                    ),
                                  ),
                                  SizedBox(height: 15),

                                  Text(
                                    'Password',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.0,
                                          //color: Colors.black38,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextFormField(
                                      controller: passwordcontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter your password";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter password',
                                          prefixIcon:
                                              Icon(Icons.password_outlined)),
                                      obscureText: true,
                                    ),
                                  ),
                                  SizedBox(height: 15.0),

                                  Text(
                                    'Confirm Password',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 1.0,
                                          //color: Colors.black38,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextFormField(
                                      controller: confirmPasswordcontroller,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return "Please enter your confirm password";
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(),
                                          hintText: 'Enter confirm password',
                                          prefixIcon:
                                              Icon(Icons.password_outlined)),
                                      obscureText: true,
                                    ),
                                  ),

                                  SizedBox(height: 20.0),

                                  //Login button made using container rather than elevatedbutton cause wanted to make customized button.

                                  GestureDetector(
                                    onTap: () {
                                      if (_formkey.currentState!.validate()) {
                                        setState(() {
                                          name = namecontroller.text;
                                          email = emailcontroller.text;
                                          password = passwordcontroller.text;
                                          confirmPassword =
                                              confirmPasswordcontroller.text;
                                        });
                                      }
                                      registration();
                                    },
                                    child: Material(
                                      elevation: 5.0,
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Container(
                                        //width: 130.0,
                                        padding: EdgeInsets.all(15.0),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFB388FF),
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        child: Center(
                                          child: Text(
                                            'Sign Up',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
                            },
                            child: Text(
                              " LogIn.",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
