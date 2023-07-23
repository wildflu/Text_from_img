

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/package.dart';

class TextScreen extends StatelessWidget {
  const TextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Package package = Get.put(Package());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, foregroundColor: Colors.black,elevation: 0 ,),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 2, color: Color.fromARGB(255, 66, 130, 215),),
          borderRadius: BorderRadius.circular(30),
        ),
        icon: Icon(Icons.content_copy, color: Color.fromARGB(255, 66, 130, 215),),
        label: const Text("Copy Text", style: TextStyle(color: Color.fromARGB(255, 66, 130, 215),),),
        onPressed: (){
          FlutterClipboard.copy(package.textFromImage).then(( value ) => print(package.textFromImage));
          Get.snackbar("Copy", "Text copied you con use it in the app. to use it out select text", duration: const Duration(seconds: 3));
        },
      ),
      body: GetBuilder<Package>(
        init: Package(),
        builder: (controller) {
          return ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
                // child: Text(controller.textFromImage),)
                child: SelectableText(controller.textFromImage.toString()),
              ),
            ],
          );
        },
      ),
    );
  }
}