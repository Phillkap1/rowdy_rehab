// ignore_for_file: prefer_const_constructors, deprecated_member_use, sort_child_properties_last

import 'package:flutter/material.dart';
import 'login.dart'; // Replace with your actual LoginPage import

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  // Dummy user data - replace with actual data fetching mechanism
  final String userName = "Korben Phillips";
  final String accountId = "123456789";
  final String userImageUrl = "https://images.sidearmdev.com/resize?url=https%3a%2f%2fdxbhsrqyrr690.cloudfront.net%2fsidearm.nextgen.sites%2fucwvathletics.com%2fimages%2f2023%2f10%2f9%2fKorben_Phillips.jpg&width=146&type=jpeg"; // Replace with actual user image URL/path

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false, // Removes back button
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImageUrl), // Use NetworkImage for network images
            radius: 70,
          ),
        ),
        SizedBox(height: 10),
        Text(userName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        Text("ID: $accountId", style: TextStyle(fontSize: 16)),

        SizedBox(height: 20),
        _buildAccountOptionButton(context, "Edit Profile", Icons.edit),
        _buildAccountOptionButton(context, "Privacy Settings", Icons.lock),
        _buildAccountOptionButton(context, "Notification Settings", Icons.notifications),

        SizedBox(height: 10),

        ElevatedButton(
          onPressed: _signOut,
          child: Text('Sign Out'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.red, minimumSize: Size(300, 50), // Text color
          ),
        ),
      ],
    ),
  );
}

  Widget _buildAccountOptionButton(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
      child: ElevatedButton.icon(
        icon: Icon(icon),
        label: Text(title),
        onPressed: () {
          // Handle button press
          print('$title button pressed');
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 0, 122, 167), minimumSize: Size(double.infinity, 50), // Text color
        ),
      ),
    );
  }

  void _signOut() {
    // Implement sign-out logic here, then navigate to LoginPage
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
  }
}
