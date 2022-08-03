import 'package:flutter/material.dart';


import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  Center(
        child: Container(
          //color: Colors.amber,
          child: OutlinedButton(

            onPressed: () async {
              AudioPlayer player = AudioPlayer();
              //await player.play(DeviceFileSource("a.mp3"));
              //await player.setSource(AssetSource('a.mp3'));

              String audioasset = "assets/a.mp3";
              ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
              Uint8List audiobytes = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
              Source? c=BytesSource(audiobytes);
              await player.play(c);
            },
            child: const Text('play sound')
          ),
        ),
      ),
    );
  }
}
