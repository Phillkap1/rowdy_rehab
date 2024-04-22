// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'Calendar_Page.dart';
import 'Workout_Page.dart';
import 'messaging.dart';
import 'login.dart';
import 'account_page.dart';
import 'quiz_page.dart';
import 'weight_graph_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resurgance',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Track the index of the currently selected page
  int _currentIndex = 0;

  // Controller for the PageView
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Resurgance',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Fonttitle'),
        ),
        backgroundColor: Color.fromARGB(255, 0, 122, 167),
      ),
      // Display the current page based on the selected index
      body: PageView(
        controller: _pageController,
        children: [
          HomeContent(),
          CalendarPage(),
          WorkoutPage(),  
          MessagingPage(),
          AccountPage(),
          QuizPage(),
          WeightGraphPage(),       
        ],
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
      // Bottom Navigation Bar for navigating between pages
      bottomNavigationBar: BottomNavigationBar(

        backgroundColor: Color.fromARGB(255, 0, 122, 167),
        selectedItemColor: Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: Color.fromARGB(255, 170, 170, 170),
        
        currentIndex: _currentIndex,

        onTap: (int index) {
          _currentIndex = index;
          _pageController.animateToPage(
            index,
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        },


        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color.fromARGB(255, 0, 122, 167),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monitor_weight_rounded),
            label: 'Workout',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messaging',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Account',
          ),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: true,
      ),
    );
  }
}


class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Resurgence_Logo.png', height: 100),
          SizedBox(height: 20),
          Text('Welcome to Resurgance', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'Fonttitle', color: Colors.black)),
          SizedBox(height: 40),
          Expanded(
            child: ListView(
              children: [
                QuizWidget(),
                RehabCounterWidget(rehabDays: 5), // Provide a value for 'rehabDays'
                WeightLiftingGraphWidget(),
                MotivationalQuoteWidget(quote: "You Got THIS!",),
              ],
            ),
          ),  
        ],
      ),
    );
  }
}

class QuizWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Rehab Quiz',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'How are you feeling mentally and physically today?',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuizPage()),
              );
            },
            child: Text('Take Quiz'),
          ),
        ],
      ),
    );
  }
}

class RehabCounterWidget extends StatelessWidget {
  final int rehabDays;

  const RehabCounterWidget({required this.rehabDays});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Rehab Days',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'You have been in rehab for $rehabDays days',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}

class WeightLiftingGraphWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Weight Lifting Graph',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WeightGraphPage()),
              );
            },
            child: Text('Progress Graph'),
          ),
        ],
      ),
    );
  }
}

class MotivationalQuoteWidget extends StatelessWidget {
  final String quote;

  const MotivationalQuoteWidget({required this.quote});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Motivational Quote',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            quote,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}