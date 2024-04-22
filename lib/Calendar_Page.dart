import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class Event {
  final String title;
  final String description;
  final DateTime time;

  Event({required this.title, required this.description, required this.time});
}

class _CalendarPageState extends State<CalendarPage> {
  late Map<DateTime, List<Event>> _events;
  late List<Event> _selectedEvents;
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _events = {};
    _selectedEvents = [];
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _selectedEvents = _events[selectedDay] ?? [];
    });
  }

  Future<void> _showAddEventDialog() async {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DateTime now = DateTime.now();
  DateTime initialDate = _selectedDay ?? now;
  TimeOfDay? pickedTime;

  // Function to show Time Picker dialog and return selected TimeOfDay
  Future<void> _pickTime() async {
    pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(hour: now.hour, minute: now.minute),
    );
    if (pickedTime != null) {
      // Update the initialDate with the time picked by the user
      initialDate = DateTime(
        initialDate.year,
        initialDate.month,
        initialDate.day,
        pickedTime!.hour,
        pickedTime!.minute,
      );
    }
  }

  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Add New Event'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(hintText: "Event Title"),
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(hintText: "Event Description"),
            ),
            ElevatedButton(
              onPressed: _pickTime, // Call the _pickTime when button pressed
              child: Text('Time'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final event = Event(
              title: titleController.text,
              description: descriptionController.text,
              time: initialDate, // Use the DateTime that includes the picked time
            );
            if (_events[_selectedDay] != null) {
              _events[_selectedDay]!.add(event);
            } else {
              _events[_selectedDay!] = [event];
            }
            Navigator.of(context).pop();
            _onDaySelected(_selectedDay!, _focusedDay);
          },
          child: Text('Add'),
        ),
      ],
    ),
  );
}

  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onDaySelected: _onDaySelected,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            eventLoader: (day) => _events[day] ?? [],
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: _selectedEvents.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_selectedEvents[index].title),
                  subtitle: Text(_selectedEvents[index].description),
                  onTap: () {
                    // Here you can implement event editing or showing details
                  },
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        _events[_selectedDay]!.removeAt(index);
                        _selectedEvents = _events[_selectedDay]!;
                      });
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddEventDialog,
        backgroundColor: Color.fromARGB(255, 0, 122, 167),
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}
