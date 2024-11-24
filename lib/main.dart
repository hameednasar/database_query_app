import 'package:flutter/material.dart';

void main() {
  runApp(DatabaseQueryApp());
}

class DatabaseQueryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async Database Query',
      home: DatabaseScreen(),
    );
  }
}

class DatabaseScreen extends StatefulWidget {
  @override
  _DatabaseScreenState createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  List<String>? data; // Data fetched from the simulated database
  bool isLoading = false; // Track loading state

  // Simulate fetching data from a database
  Future<void> fetchData() async {
    setState(() {
      isLoading = true; // Show loading indicator
    });

    // Simulate a delay to mimic a database query
    await Future.delayed(Duration(seconds: 3));

    // Mock data representing database rows
    List<String> fetchedData = [
      "Row 1: Hamed",
      "Row 2: pakistan",
      "Row 3: Rehan",
      "Row 4: Saleem",
      "Row 5: japan"
    ];

    setState(() {
      data = fetchedData; // Update the UI with the fetched data
      isLoading = false; // Hide loading indicator
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Async Database Query'),
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator() // Show a spinner while loading
            : data != null
                ? ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(data![index]),
                      );
                    },
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'No Data Loaded!',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: fetchData,
                        child: Text('Load Data'),
                      ),
                    ],
                  ),
      ),
    );
  }
}
