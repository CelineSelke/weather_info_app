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
      
            Text(
              'Enter City Name:',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(onPressed: () => checkWeather(), child: Text('Fetch Weather')),
            Text('Temperature: $temp degrees'),
            Text('Condition: $condition'),
          ],

        ),
      ),

    );
  }
}
