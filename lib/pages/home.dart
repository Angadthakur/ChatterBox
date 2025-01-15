import 'package:chatter_box/pages/login.dart';
import 'package:chatter_box/service/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // For Firebase Firestore
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool search = false;

  // Lists to store search results
  var queryResultSet = [];
  var tempSearchStore = [];

  // Function to handle search queries
  void initiateSearch(String value) async {
    if (value.isEmpty) {
      setState(() {
        queryResultSet = [];
        tempSearchStore = [];
      });
      return;
    }

    // Perform Firestore query to search users by username
    var queryResults = await DatabaseMethods().getUserByUsername(value);

    setState(() {
      queryResultSet = queryResults; // Raw Firestore documents
      tempSearchStore = queryResults
          .map((doc) => doc.data() as Map<String, dynamic>) // Extract user data
          .toList();
    });
  }

  // Logout function
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
    return GestureDetector(
      onTap: () {
        if (search){
          setState(() {
            search=false;
          });
        }
      },
      child: Scaffold(
          backgroundColor: Color(0xFFB388FF),
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
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
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(20)),
                          child: Tooltip(
                            message: "Log Out",
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                            ),
                            child: Icon(
                              Icons.logout_outlined,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      search
                          ? Expanded(
                              child: TextField(
                                onChanged: (value) {
                                  initiateSearch(value); // Trigger search on text input
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintText: 'Search User',
                                  hintStyle: TextStyle(
                                    color: Colors.black38,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )
                          : Text(
                              'Chatter Box',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.bold),
                            ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            search = true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(20)),
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  height: MediaQuery.of(context).size.height / 1.1,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: search
                      ? ListView.builder(
                          itemCount: tempSearchStore.length,
                          itemBuilder: (context, index) {
                            var user = tempSearchStore[index];
                            return ListTile(
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  user['Photo'], // User's photo URL
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                user['username'], // Display username
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              subtitle: Text(user['E-mail']), // Display email
                              onTap: () {
                                // Action on selecting a user (e.g., navigate to chat page)
                                print('User selected: ${user['username']}');
                              },
                            );
                          },
                        )
                      : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'No Chat 😔 \nSeach for a friend 🤩',
                              style: TextStyle(
                                  color: Colors.black45, fontSize: 20.0),
                            )
                          ],
                        ),
                ),
              ],
            ),
          )),
    );
  }
}

