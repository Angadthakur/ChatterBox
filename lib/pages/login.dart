import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      
                      child:Column(
                        
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
        
                            child: TextField(
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
        
                            child: TextField(
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
                            child: Text('Forgot password?',
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500
                            ),
                            ),
                          ),
                          SizedBox(height: 60.0 ),


                          //Login button made using container rather than elevatedbutton cause wanted to make customized button. 

                          Material( 
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
                          ],
        
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
                    Text(
                      " Sign Up.",
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600
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



