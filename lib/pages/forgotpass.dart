import 'package:chatter_box/pages/login.dart';
import 'package:chatter_box/pages/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({super.key});

  @override
  State<ForgotPass> createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {

  String email="";
  final _formkey= GlobalKey<FormState>();


  TextEditingController usermailcontroller = TextEditingController();


  resetPassword()async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
        'Password Reset Email has been sent',
        style: TextStyle(
          fontSize: 18.0
        ),
        )));
    }on FirebaseAuthException catch(e){
      if(e.code=="user-not-found"){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No user found for that email',style: TextStyle(fontSize:18.0 ),)));
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
                height: MediaQuery.of(context).size.height/3.7,
                width: MediaQuery.of(context).size.width,
        
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
                    child: Text('Password Recovery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                  ),
        
                  SizedBox(height:15 ,),
        
                  Center(
                    child: Text('Enter your email',
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
                      height: MediaQuery.of(context).size.height/2.8,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      
                      child:Form(
                        
                        child: Form(
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
                          
                             
                              SizedBox(height: 60.0 ),
                          
                          
                              //Login button made using container rather than elevatedbutton cause wanted to make customized button. 
                          
                              GestureDetector(
                                onTap: () {
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      email=usermailcontroller.text;
                                    });
                                    resetPassword();

                                  }
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
                                      child: Text('Send Email',
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
                ),
                SizedBox(height:40.0 ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ready to",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                      },
                      child: Text(
                        " Login?.",
                        style: TextStyle(
                          color: Colors.purple,
                          fontSize: 25.0,
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
