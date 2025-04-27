import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Home/home_screen/home_page.dart';

class firstscreen extends StatefulWidget {
  const firstscreen({super.key});

  @override
  State<firstscreen> createState() => _firstscreenState();
}

class _firstscreenState extends State<firstscreen> {
  ImagePicker imagePicker = ImagePicker();

  List<File>? SelectedImage = [];

  Future<void> imageSelector() async {
    List<XFile>? images = await imagePicker.pickMultiImage();
    if (images != null && mounted) {
      setState(() {
        SelectedImage!.addAll(
          images.map((toElement) => File(toElement!.path)).toList(),
        );
        // SelectedImage = File(image!.path);
      });
    }
  }

  TextEditingController title = TextEditingController();

  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder:
                    (context) => MyHomePage(
                      title: title.text,
                      body: body.text,
                      image: SelectedImage,
                    ),
              ),
            );
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/background.jpg"),
          ),
        ),
        child: ListView(
          children: [
            SizedBox(height: 150),
            SelectedImage!.isEmpty
                ? Container(
                  color: Colors.white38,
                  height: 90,
                  width: MediaQuery.sizeOf(context).width - 20,
                  child: IconButton(
                    onPressed: () {
                      imageSelector();
                    },
                    icon: Icon(Icons.camera_alt),
                  ),
                )
                : Row(
                  children: [
                    Container(
                      color: Colors.white38,
                      height: 100,
                      width: 100,
                      child: IconButton(
                        onPressed: () {
                          imageSelector();
                        },
                        icon: Icon(Icons.camera_alt),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width - 120,
                      height: 100,

                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children:
                            SelectedImage!
                                .map(
                                  (toElement) => Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0,
                                        ),
                                        child: Image.file(
                                          toElement,
                                          height: 100,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            SelectedImage!.removeAt(
                                              SelectedImage!.indexOf(toElement),
                                            );
                                          });
                                        },
                                        icon: Icon(Icons.cancel),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                      ),
                    ),
                  ],
                ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                  hintText: "title",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            TextField(
              controller: body,
              minLines: 3,
              maxLines: 6,
              decoration: InputDecoration(
                hintText: "body",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder:
                  (context) => MyHomePage(
                    title: title.text,
                    body: body.text,
                    image: SelectedImage,
                  ),
            ),
          );
        },
      ),
    );
  }
}
