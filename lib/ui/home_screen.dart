


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:textfromimg/ui/text_re_screen.dart';

import '../model/package.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Package _packagecontroler = Get.put(Package());

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
        body: GetBuilder<Package>(
          init: Package(),
          builder: (controller) {
            return Stack(
              children: [
                Positioned(
                  top: 20,
                  left: 20,
                  right: 20,
                  bottom: 100,
                  child: controller.fi !=null
                  ? Image.file(_packagecontroler.fi!, fit: BoxFit.cover,)
                  : const Center(child: Text("Pick Image"),)
                ),
                Positioned(
                  bottom: 20,
                  left: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.black)
                    ),
                    child: IconButton(
                      color: Colors.blue,
                      onPressed: (){Get.to(()=> const TextScreen());}, icon: const Icon(CupertinoIcons.doc_text_viewfinder)),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 20,
                  left: 100,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      side: BorderSide(width: 2, color: Colors.black)
                    ),
                      onPressed: () async {
                        Get.bottomSheet(
                          BottomSheet(onClosing: (){}, builder: (context) {
                            return Container(
                              height: 200,
                              child: Row(
                                children: [
                                  Expanded(flex:1,child: IconButton(onPressed: (){controller.getImage(false);Get.back();}, icon: Icon(Icons.camera_alt_outlined, size: 70,))),
                                  Expanded(flex:1,child: IconButton(onPressed: (){controller.getImage(true);Get.back();}, icon: Icon(Icons.image_outlined, size: 70,))),
                                ],
                              ),
                            );
                          },)
                        );
                      },
                      child: const Text("Pick Image", style: TextStyle(color: Colors.blue),)),
                ),
              ],
            );
          },
        ));
  }
}
