import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ImagePicker imagePicker = ImagePicker();

  File? SelectedImage;

  Future<void> imageSelector(ImageSource source) async {
    XFile? image = await imagePicker.pickImage(source: source);
    if (image != null && mounted) {
      setState(() {
        SelectedImage = File(image!.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile", style: TextStyle(fontSize: 25))),
      body: Column(
        children: [
          Center(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey.shade500,
                  radius: 110,
                  child:
                      SelectedImage == null
                          ? Icon(Icons.person, size: 200, color: Colors.white38)
                          : ClipOval(
                            child: Image.file(
                              fit: BoxFit.cover,
                              width: 220,
                              height: 220,
                              SelectedImage!,
                            ),
                          ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 30,
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder:
                            (context) => SizedBox(
                              height: 150,
                              child: Column(
                                children: [
                                  Text("Profile"),
                                  Divider(),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Options(
                                        onpressed: () {
                                          imageSelector(ImageSource.camera);
                                        },
                                        title: "camera",
                                        icon: Icons.camera,
                                      ),

                                      Options(
                                        onpressed: () {
                                          imageSelector(ImageSource.gallery);
                                          Navigator.pop(context);
                                        },
                                        title: "Gallery",
                                        icon: Icons.image,
                                      ),
                                      if (SelectedImage != null)
                                        Options(
                                          selectedImage: SelectedImage,
                                          onpressed: () {
                                            if (mounted) {
                                              setState(() {
                                                SelectedImage = null;
                                              });
                                            }
                                            Navigator.pop(context);
                                          },
                                          title: "Delete",
                                          icon: Icons.delete,
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                      );
                    },
                    icon: Icon(color: Colors.grey, Icons.camera_alt, size: 30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Options extends StatelessWidget {
  final String? title;
  File? selectedImage;

  final IconData? icon;
  final VoidCallback? onpressed;
  Options({
    required this.onpressed,
    required this.title,
    this.selectedImage,
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          onPressed: onpressed,
          icon: Icon(
            icon,
            size: 40,
            color: selectedImage != null ? Colors.red : Colors.grey.shade500,
          ),
          //Icon(),
        ),
        Text(title!),
      ],
    );
  }
}
