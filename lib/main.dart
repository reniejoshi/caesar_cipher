import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _alphabet = "abcdefghijklmnopqrstuvwxyz";
  int _shift = 7;

  void _encode(String originalText) {
    Uint8List asciiBytes = ascii.encode(originalText);
    List<String> encodedText = [];
    asciiBytes.forEach((asciiByte) {
      encodedText.add(String.fromCharCode(asciiByte + _shift));
    });
    print(encodedText); // For testing
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.all(15),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(
                    color: Colors.white10,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                  Text(
                    "Original Text",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                    )
                  ),
                  TextField(
                    onChanged: _encode,
                    decoration: InputDecoration(
                      hintText: 'Enter original text'
                    ),
                  ),
                  ],
                )
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(15),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(
                    color: Colors.white10,
                    width: 2
                  )
                ),
                child: Column(
                  children: [
                    Text(
                      "Caesar Cipher",
                      textAlign: TextAlign.center,
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            _shift -= 1;
                          },
                          style: ButtonStyle(
                            overlayColor: WidgetStateProperty.all(Colors.transparent)
                          ),
                          child: Text("-")
                        ),
                        Padding(
                          padding: EdgeInsetsGeometry.all(10),
                          child: Text("a -> a"),
                        ),
                        TextButton(
                          onPressed: () {
                            _shift += 1;
                          },
                          style: ButtonStyle(
                            overlayColor: WidgetStateProperty.all(Colors.transparent)
                          ),
                          child: Text("+")
                        )
                      ]
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsGeometry.all(15),
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white10,
                  border: Border.all(
                    color: Colors.white10,
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "Cipher Text",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      )
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
