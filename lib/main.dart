import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
void main() {
  runApp(const MaterialApp(
    home: MyApp(),
    title: "MyApp",
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? f ;
  String textr = "";  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: const Text("Text From Image"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          if(f!=null) Image.file(f!),
          ElevatedButton(
            onPressed: ()async{
              f = await getImage();
              setState(() {});
            },
          child: Text("Pick Image")),
          Text(textr),
        ],
      ),
    );
  }

  Future<File?> getImage() async{
    final ImagePicker picker = ImagePicker();
    var file = await picker.pickImage(source: ImageSource.gallery);
    if(file != null) {
      reconiseText(File(file.path));
      return File(file.path);
    }else {
      return null;
    }
  }

  void reconiseText(File? f)async {
    final inputimage = InputImage.fromFilePath(f!.path);
    final textdetect = GoogleMlKit.vision.textRecognizer();

    RecognizedText rectext = await textdetect.processImage(inputimage);
    textdetect.close();
    textr = "";
    for(TextBlock tb in rectext.blocks) {
      for(TextLine tl in tb.lines) {
        textr += "${tl.text} \n";
      }
    }
    setState(() {
      
    });
  }

}