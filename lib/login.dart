// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'dart:ui';
import 'package:flutter/material.dart';
import 'main.dart'; // Ensure you import your HomePage correctly.

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackground(),
          _buildLoginContent(),
        ],
      ),
    );
  }

  Widget _buildBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
        ),
      ),
    );
  }

  Widget _buildLoginContent() {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/Resurgence_Logo.png', height: 100),
            SizedBox(height: 20),
            Text('Resurgance', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, fontFamily: 'Fonttitle', color: Colors.white)),
            SizedBox(height: 40),
            _buildTextField(_usernameController, 'Username'),
            SizedBox(height: 20),
            _buildTextField(_passwordController, 'Password', isPassword: true),
            SizedBox(height: 20),
            _buildRememberMeCheckbox(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Log In'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Color.fromARGB(255, 0, 122, 167), // Set button text color to white
              ),
            ),
            TextButton(
              onPressed: _forgotPassword,
              child: Text('Forgot Password?'),
              style: TextButton.styleFrom(foregroundColor: Colors.white),
            ),
            ElevatedButton(
              onPressed: _showUserInformationPopup,
              child: Text('Create Account'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green, // Set button text color to white
              ),
            ),
            // You can add more widgets here as needed
          ],
        ),
      ),
    );
  }

  void _showUserInformationPopup() {
    TextEditingController emailController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Account'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTextField(usernameController, 'Username'),
              SizedBox(height: 10),
              _buildTextField(passwordController, 'Password', isPassword: true),
              SizedBox(height: 10),
              _buildTextField(emailController, 'Email'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60.0), // Add horizontal padding
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: TextStyle(color: Colors.white), // Set text color to white
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white), // Set label color to white
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0), // Set enabled border color and width
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 2.0), // Set focused border color and width
          ),
        ),
      ),
    );
  }

  Widget _buildRememberMeCheckbox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return Color.fromARGB(255, 0, 122, 167); // Set selected color to Blue
            }
            return Colors.white; // Set unselected color to white
          }),
          value: _rememberMe,
          onChanged: (bool? value) {
            setState(() {
              _rememberMe = value ?? false;
            });
          },
        ),
        Text('Remember my details', style: TextStyle(color: Colors.white)),
      ],
    );
  }

  void _login() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void _forgotPassword() {
  }
}