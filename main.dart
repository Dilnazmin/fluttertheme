import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyText1: (GoogleFonts.abel(
              fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
          bodyText2: (GoogleFonts.lato(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.normal)),
        ),
      ),
      home: HomePage(title: 'Background Color Change'),
    );
  }
}

class HomePage extends StatefulWidget {
  final String title;
  HomePage({required this.title});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  void increaseCounter() {
    setState(() {
      _counter++;
    });
  }

  void decreaseCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
  }

  void resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  List<Color> _color = [
    Colors.purpleAccent,
    Colors.orangeAccent,
    Colors.pink,
    Colors.white,
    Colors.blueAccent,
    Colors.yellowAccent,
    Colors.redAccent,
    Colors.greenAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _color[_counter % _color.length],
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        // elevation: 0.0,
        title: Text("Flutter change colors"),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                increaseCounter();
              }),
          SizedBox(width: 10.0),
          FloatingActionButton(
              child: Icon(Icons.remove), onPressed: decreaseCounter),
          SizedBox(width: 10.0),
          FloatingActionButton(
              child: Icon(Icons.refresh), onPressed: resetCounter),
          SizedBox(width: 10.0),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tapped Button  Background Colors change:",
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              "$_counter",
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
