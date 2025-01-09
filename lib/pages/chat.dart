import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0xFFB388FF),
      resizeToAvoidBottomInset: true, // Ensures the layout adjusts when the keyboard appears
      body: SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(top: 60),
        
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                 Icon(Icons.arrow_back_outlined,size: 25,color: Colors.white,),
                 SizedBox(width:90),
                 Text(
                        'Angad Thakur',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w500),
                      ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
            padding: EdgeInsets.only(left: 20,right:20,top: 30,bottom: 35 ),  
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin:EdgeInsets.only(left: MediaQuery.of(context).size.width/2.1) ,
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 197, 206, 237),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    ),
                  child: Text('Hello , how are you?',
                  style:TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400
                  ) ,
                  ),
                  ),
                  SizedBox(height: 20),

                  Container(
                    padding: EdgeInsets.all(10),
                    margin:EdgeInsets.only(right: MediaQuery.of(context).size.width/2.1) ,
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 213, 216, 225),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        //bottomLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                       )
                    ),
                    
                    child: Text("I'm fine, what about you.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize:17,
                      fontWeight: FontWeight.w400 
                    ),
                    ),
                  ),
                  Spacer(),
                 Container(
                  //padding: EdgeInsets.only(left: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child:Row(
                    children: [
                      Expanded( // using this the text field will use as much area as it requires. 
                        child: TextField(
                          maxLines: null, // For multiple line input.
                          decoration: InputDecoration(
                            hintText: 'Message',
                            hintStyle: TextStyle(
                              color: Colors.black45
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25)
                            )
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),

                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 231, 228, 228),
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: Center(child: Icon(Icons.send,size: 25,)))
                    ],
                  ) ,
                 ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}