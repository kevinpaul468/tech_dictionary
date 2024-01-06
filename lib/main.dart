import 'package:flutter/material.dart';

void main() => runApp(MyApp());

Map<String, List<String>> dictionary = {};


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> definitions = []; // To store the definition of the entered word
  List<String> temp_definitions = [];
  String key = "";
  String info = "";
  final TextEditingController _textController1 = TextEditingController();
  final TextEditingController _textController2 = TextEditingController();
  final TextEditingController _textController3 = TextEditingController();

  void _clearTextField() {
    _textController1.clear();
    _textController2.clear();
    _textController3.clear();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tech Dictionary",
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Center(child: Text("CSM Tech Dictionary")),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Add here',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Set text to bold
                        fontSize: 16.0, // Set text size (optional)
                        // Other text styles like color, etc. can be added here
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          // Check if the entered word exists in the dictionary
                          setState(() {
                            key = value.toLowerCase().trim();
                          });
                        },
                        controller: _textController1,
                        decoration: InputDecoration(
                          hintText: 'Enter Keyword',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          // Check if the entered word exists in the dictionary
                          setState(() {
                            info = value;
                          });
                        },
                        controller: _textController2,
                        decoration: InputDecoration(
                          hintText: 'Enter Information',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Background color
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Padding
                          ),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(fontSize: 18.0), // Text style
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0), // Button border radius
                              side: BorderSide(color: Colors.green), // Border side color
                            ),
                          ),
                        ),
                        child: Text(
                          "Add Info",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          if (dictionary[key] == null){
                            dictionary[key] = [];
                          }
                          dictionary[key]!.add(info);
                          _clearTextField();
                        },
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Search here',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // Set text to bold
                        fontSize: 16.0, // Set text size (optional)
                        // Other text styles like color, etc. can be added here
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          // Check if the entered word exists in the dictionary
                          temp_definitions = dictionary[value.toLowerCase().trim()] ?? [];
                        },
                        controller: _textController3,
                        decoration: InputDecoration(
                          hintText: 'Search Keyword',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.green), // Background color
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Text color
                          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0), // Padding
                          ),
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(fontSize: 18.0), // Text style
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0), // Button border radius
                              side: BorderSide(color: Colors.green), // Border side color
                            ),
                          ),
                        ),
                        child: Text(
                          "Search",
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            definitions = temp_definitions;
                          });
                          _clearTextField();
                        },
                      ),
                    ),

                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.teal,
                child: ListView.builder(
                  itemCount: definitions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100, // Set the height of each box
                      margin: EdgeInsets.all(8.0), // Add margin around the box
                      decoration: BoxDecoration(
                        color: Colors.blue, // Set box color
                        borderRadius: BorderRadius.circular(10.0), // Set border radius
                      ),
                      child: Center(
                        child: Text(
                          definitions[index], // Display text from the list
                          style: TextStyle(
                            color: Colors.white, // Set text color
                            fontSize: 18.0, // Set text size
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


