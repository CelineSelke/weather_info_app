import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Weather Info App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  String userInput = '';
  final TextEditingController _controller = TextEditingController();

  void updateText() {
    setState(() {
    userInput = _controller.text; // Update the user input variable
    });
  }


  int temp = 0; 
  var condition = '';

    void checkWeather(){
    final random = Random();
      
    int newTemp = 15 + random.nextInt(30 - 15);

    var conditions = ['sunny','cloudy','rainy'];

    var newCondition = conditions[random.nextInt(conditions.length)];

    setState(() { temp = newTemp;});

    setState(() { condition = newCondition;});

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
      
            Center(
              child: SizedBox(
                width: 200.0,
                child: TextField(
                  controller: _controller, 
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: 10.0,
                    ),
                    border: OutlineInputBorder(),
                    hintText: 'Enter city here: ',
                  ),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                updateText();
                checkWeather();
              },
              child: const Text('Fetch Weather'),
            ),

            SizedBox(
              width: 300,
              child: Column(
                children: [
                  Text('City: $userInput', style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text('Temperature: $temp degrees'),
                  Text('Condition: $condition'),
                ],
              ),
            ),
          ],

        ),
      ),

    );
  }
}
