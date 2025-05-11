import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:section_1/Profile/profile_widgets/user_model.dart';
import 'Options.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile", style: TextStyle(fontSize: 25))),
      body: Column(
        children: [
          Center(
            child: Consumer<UserModel>(
              builder:
                  (context, userModel, child) => Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey.shade500,
                        radius: 110,
                        child:
                            userModel.user?.image == null
                                ? Icon(
                                  Icons.person,
                                  size: 200,
                                  color: Colors.white38,
                                )
                                : ClipOval(
                                  child: Image.file(
                                    fit: BoxFit.cover,
                                    width: 220,
                                    height: 220,
                                    userModel.user!.image!,
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
                                                userModel.imageSelector(
                                                  ImageSource.camera,
                                                );
                                              },
                                              title: "camera",
                                              icon: Icons.camera,
                                            ),

                                            Options(
                                              onpressed: () {
                                                userModel.imageSelector(
                                                  ImageSource.gallery,
                                                );
                                                Navigator.pop(context);
                                              },
                                              title: "Gallery",
                                              icon: Icons.image,
                                            ),
                                            if (userModel.user?.image != null)
                                              Options(
                                                selectedImage:
                                                    userModel.user?.image,
                                                onpressed: () {
                                                  userModel.removeImage();
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
                          icon: Icon(
                            color: Colors.grey,
                            Icons.camera_alt,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
