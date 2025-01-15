import 'package:chatter_box/pages/login.dart';
import 'package:chatter_box/service/database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool search = false;

//List 
var queryResultSet=[];
var tempSearchStore=[];



initiateSearch(value){
  if(value.length==0){
    setState(() {
      queryResultSet=[]; // Null list if the length in 0
      tempSearchStore=[];
    });
  }
  setState(() {
    search=true; // when user type on the search field all the chats disappear and username appears
  });

  var capitalizedValue= value;



}

void logout() async {
  final _auth = DatabaseMethods();

  // Sign out the user
  await _auth.signOut();

  // Navigate to the LoginPage
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => LoginPage()),
    (route) => false, // Removes all previous routes from the stack
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFB388FF),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 50.0, bottom: 20.0),
                  child: Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          logout();
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration:BoxDecoration(
                            color: Colors.black26,
                            borderRadius: BorderRadius.circular(20)
                          ) ,
                          child: Tooltip(
                            message: "Log Out",
                            textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,),
                            child: Icon(Icons.logout_outlined,color: Colors.white,))),
                      ),
                      search
                          ? Expanded(
                              child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Search User',
                                  hintStyle: TextStyle(
                                      color: Colors.black38,
                                      fontWeight: FontWeight.w500)),
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0, 
                                        fontWeight: FontWeight.w500
                                      ),
                            ))
                          : Text(
                              'Chatter Box',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            
                      GestureDetector(
                        onTap: () {
                          search = true;
                          setState(() {});
                        },
                        child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.black26,
                                borderRadius: BorderRadius.circular(20)),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  height: search?MediaQuery.of(context).size.height/1.19: MediaQuery.of(context).size.height / 1.18, //1.15
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(60),
                              child: Image.asset(
                                'assets/person1.png',
                                height: 70.0,
                                width: 70.0,
                                fit: BoxFit.cover,
                              )),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //SizedBox(height: 10.0),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Angad Thakur',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Text(
                                'Hello, how are you?',
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          //SizedBox(width: 50),
                          Spacer(),
                          Text(
                            '02:30 PM',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.asset(
                              'assets/person2.png',
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //SizedBox(height: 10,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Joseph Joestar',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Text(
                                'Are you free tonight?',
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Spacer(),
                          // SizedBox(
                          //   width: 50,
                          // ),
                          Text(
                            '05:16 PM',
                            style: TextStyle(
                                color: Colors.black45,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

