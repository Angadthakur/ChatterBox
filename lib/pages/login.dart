import 'package:chatter_box/pages/forgotpass.dart';
import 'package:chatter_box/pages/home.dart';
import 'package:chatter_box/pages/signup.dart';
import 'package:chatter_box/service/database.dart';
import 'package:chatter_box/service/shared_pref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

String email="";
String password="";
String name="";
String username="";
String pic="";
String id="";

TextEditingController usermailcontroller = TextEditingController();
TextEditingController userpasswordcontroller = TextEditingController();


final _formkey = GlobalKey<FormState>();

userLogin()async{
  //Error handling.
  try{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    
    // Call the getUserbyemail method to get matching documents
    QuerySnapshot querySnapshot =  await DatabaseMethods().getUserbyemail(email);

    //Extracts data.
    name ="${querySnapshot.docs[0]["Name"]}";
    username="${querySnapshot.docs[0]["username"]}";
    pic="${querySnapshot.docs[0]["Photo"]}";
    id= querySnapshot.docs[0].id;

//Save user detail
     /*await SharedPrefHelper().saveUserDisplayName(name);
     await SharedPrefHelper().saveUserName(username);
     await SharedPrefHelper().saveUserId(id);
     await SharedPrefHelper().saveUserPic(pic);*/

   Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> Home()));
  }on FirebaseAuthException catch(e){
    if(e.code=="user-not-found"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orangeAccent,
        content: Text(
        'No User found',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
        )));
    }else if (e.code=="wrong-password"){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.orangeAccent,
        content: Text(
        'Wrong password',
        style: TextStyle(
          fontSize: 18.0,
          color: Colors.black,
        ),
        )));
    
  }
}
}



  @override
  Widget build(BuildContext context) {
        return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true, // Ensures the layout adjusts when the keyboard appears
      body: SingleChildScrollView( // Allows content to scroll when needed
        child: Container(
          
          child: Stack(
            
            children: [
              Container(
                //height:Adaptive.h() ,
                height: MediaQuery.of(context).size.height/3.7,
                width: MediaQuery.of(context).size.width,
                //width: Adaptive.w(20),
        
                decoration: BoxDecoration(
                  gradient:LinearGradient(colors: [Color(0xFF4FC3F7),Color(0xFFB388FF)],
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.elliptical(MediaQuery.of(context).size.width, 105.0))
              )
              ),
              Padding(
                padding: const EdgeInsets.only(top:70 ),
                child: Column(
                  children: [
                  Center(
                    child: Text('Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
        
                  SizedBox(height:15 ,),
        
                  Center(
                    child: Text('LogIn to your account!!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
                  SizedBox(height: 10.0),

                Container(
                  margin: EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0 ),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(10),
                    
                    child: Container(
                      padding:EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0) ,
                      height: MediaQuery.of(context).size.height/2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      
                      child:Form(
                        key: _formkey,
                        child: Column(
                          
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:Border.all(width: 1.0,
                                //color: Colors.black38,
                                ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                                
                              child: TextFormField(
                                controller: usermailcontroller,
                                validator: (value) {
                                  if(value==null || value.isEmpty){
                                  return "Please Enter your E-mail";
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter email ID',
                                  prefixIcon: Icon(Icons.mail_outline)
                                
                                ),
                        
                              ),
                            ),
                            SizedBox(height:35),
                        
                            Text('Password',
                            style: TextStyle(
                              
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border:Border.all(width: 1.0,
                                //color: Colors.black38,
                                ),
                                borderRadius: BorderRadius.circular(10)
                              ),
                                
                              child: TextFormField(
                                controller: userpasswordcontroller,
                                validator: (value) {
                                  if(value==null || value.isEmpty){
                                    return "Please Enter your password";

                                  }
                                  return null;
                                },
                               decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Enter password',
                                  prefixIcon: Icon(Icons.password_outlined)
                                 ),
                                obscureText: true,
                        
                              ),
                            ),
                            SizedBox(height: 10.0),
                        
                            Container(
                              alignment: Alignment.bottomRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgotPass()));
                                },
                                child: Text('Forgot password?',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.purple,
                                ),
                                ),
                              ),
                            ),
                            SizedBox(height: 60.0 ),
                        
                        
                            //Login button made using container rather than elevatedbutton cause wanted to make customized button. 
                        
                            GestureDetector(
                              onTap: () {
                                if(_formkey.currentState!.validate()){
                                  setState(() {
                                    email=usermailcontroller.text;
                                    password=userpasswordcontroller.text;
                                  });
                                }
                                userLogin();
                              },
                              child: Material( 
                                elevation: 5.0,
                                 borderRadius: BorderRadius.circular(10.0),
                                child: Container(
                                  width: 130.0,
                                  padding: EdgeInsets.all(15.0) ,
                                  decoration: BoxDecoration(
                                  color: Color(0xFFB388FF),
                                  borderRadius: BorderRadius.circular(10.0)
                                  ),
                                  child:
                                  Center(
                                    child: Text('LogIn',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold
                                    ),),
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
                SizedBox(height:40.0 ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0),
                    ),
                    GestureDetector(
                      
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> Signup()));
                      },
                    child:Text(
                      " Sign Up.",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600
                      ),
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
      )
    );
  }
}



