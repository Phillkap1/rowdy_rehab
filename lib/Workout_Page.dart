// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  const WorkoutPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WorkoutPageState createState() => _WorkoutPageState();
}

class Exercise {
  String name;
  int sets;
  int reps;
  TextEditingController weightController;

  Exercise({
    required this.name,
    this.sets = 3,
    this.reps = 8,
    String weight = '',
  }) : weightController = TextEditingController(text: weight);
}


class _WorkoutPageState extends State<WorkoutPage>{
  final List<Exercise> mondayWorkout = 
  [
    Exercise(name: "Banded Shoulder Warmup", sets: 3, reps: 8),
    Exercise(name: "Bicep Curls", sets: 3, reps: 8),
    Exercise(name: "Tricep Extension", sets: 3, reps: 8),
    Exercise(name: "Should Press", sets: 3, reps: 8),
    Exercise(name: "Bench Press", sets: 3, reps: 8),
    Exercise(name: "Crunches", sets: 3, reps: 8),
    Exercise(name: "Plank", sets: 3, reps: 1),
    Exercise(name: "Ankle Circles", sets: 3, reps: 16),
    Exercise(name: "Alphabet Writing", sets: 3, reps: 1),
    Exercise(name: "Towel Stretch", sets: 3, reps: 1),
  ];

  final List<Exercise> wednesdayWorkout =
  [
    Exercise(name: "Hip Mobility Stretches", sets: 3, reps: 1),
    Exercise(name: "Lunges"),
    Exercise(name: "Heel Raises"),
    Exercise(name: "Toe Raises"),
    Exercise(name: "Theraband Flexion"),
    Exercise(name: "Squats"),
    Exercise(name: "Leg Extension"),
    Exercise(name: "Hamstring Curl"),
  ];

  final List<Exercise> fridayWorkout =
  [
    Exercise(name: "Single Leg Balance", sets: 3, reps: 1),
    Exercise(name: "Bosu Ball Balance", sets: 3, reps: 1),
    Exercise(name: "Side Leg Raises"),
    Exercise(name: "Shoulder Press"),
    Exercise(name: "Pull Ups"),
    Exercise(name: "Calf Raises"),
  ];

  final List<Exercise> saturdayWorkout =
  [
    Exercise(name: "Step-Ups"),
    Exercise(name: "Walking Lunges"),
    Exercise(name: "Bulgarian Split Squats"),
    Exercise(name: "Crunches"),
    Exercise(name: "Hack Squat"),
  ];

  Widget _buildWorkout(List<Exercise> workout) {
    return ListView.builder(
      itemCount: workout.length,
      itemBuilder: (context, index) {
        final exercise = workout[index];
        return ListTile(
          title: Text(exercise.name),
          subtitle: Row(
            children: [
              Text('Sets: ${exercise.sets}, Reps: ${exercise.reps}'),
              SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: exercise.weightController,
                  decoration: InputDecoration(
                    labelText: 'Weight',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Workout'),
          bottom: TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Mon'),
              Tab(text: 'Tue'),
              Tab(text: 'Wed'),
              Tab(text: 'Thu'),
              Tab(text: 'Fri'),
              Tab(text: 'Sat'),
              Tab(text: 'Sun'),
            ],
          ),
        ),
        body: TabBarView(
          children: 
          [
            _buildWorkout(mondayWorkout),
            Center(child: ElevatedButton(onPressed: () {}, child: Text('Rest Day'))),
            _buildWorkout(wednesdayWorkout),
            Center(child: ElevatedButton(onPressed: () {}, child: Text('Rest Day'))),
            _buildWorkout(fridayWorkout),
            _buildWorkout(saturdayWorkout),
            Center(child: ElevatedButton(onPressed: () {}, child: Text('Rest Day'))),
          ],
        ),
      ),
    );
  }
}