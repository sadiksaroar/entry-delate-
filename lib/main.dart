import 'package:flutter/material.dart';

void main() {
  runApp(TimeTrackerApp());
}

class TimeTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> timeEntries = [
    {
      "id": "1",
      "project": "Project A",
      "task": "Design UI",
      "time": "2h",
      "date": "Mar 7, 2025",
    },
    {
      "id": "2",
      "project": "Project B",
      "task": "Fix Bugs",
      "time": "3h",
      "date": "Mar 8, 2025",
    },
    {
      "id": "3",
      "project": "Project C",
      "task": "Develop API",
      "time": "4h",
      "date": "Mar 9, 2025",
    },
  ];

  void deleteEntry(String id) {
    setState(() {
      timeEntries.removeWhere((entry) => entry["id"] == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Time Entries")),
      body: ListView.builder(
        itemCount: timeEntries.length,
        itemBuilder: (context, index) {
          final entry = timeEntries[index];

          return Dismissible(
            key: Key(entry["id"]!),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              deleteEntry(entry["id"]!);
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: Card(
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                title: Text("${entry['task']} (${entry['time']})"),
                subtitle: Text("${entry['project']} - ${entry['date']}"),
                leading: Icon(Icons.access_time),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () => deleteEntry(entry["id"]!),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
