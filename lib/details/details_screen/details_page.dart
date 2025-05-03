import 'dart:io';

import 'package:flutter/material.dart';
import 'package:section_1/Profile/profile_widgets/user_model.dart';
import 'package:section_1/details/details_widgets/details_widgets.dart';
import '../../Profile/profile_page/profile_page.dart';
import '../../add_item/add_item_screen.dart';
import '../../add_item/item_model.dart';
import '../details_widgets/details_widgets.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  final String? title;
  final String? body;
  final List<File>? image;

  const DetailsPage({super.key, this.image, this.title, this.body});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => AddItemScreen()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
            icon:
                profileImage == null
                    ? Icon(Icons.account_box)
                    : CircleAvatar(
                      child: ClipOval(
                        child: Image.file(
                          profileImage,
                          fit: BoxFit.cover,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
          ),
        ],
        centerTitle: true,
        title: Text(
          "the ${items.SelectedItem?.title}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // image == null || image!.isEmpty
              //     ? Image.asset(
              //       "assets/bug.jpeg",
              //       height: 500,
              //       fit: BoxFit.cover,
              //     )
              Image.file(
                items.SelectedItem!.images.first,
                height: 500,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.share, color: Colors.blue),
                  ),
                  FavouriteWidget(),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  textAlign: TextAlign.justify,
                  items.SelectedItem!.body,
                  // ?? "My Tree is tall and big"
                  style: TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
              const SizedBox(height: 20),
              // const Text(
              //   "Car Brands",
              //   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              // ),
              const SizedBox(height: 10),
              // image == null || image!.isEmpty
              //     ? Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: const [
              //         CarType(url: "assets/lambo.jpeg", text: "Lamborgini"),
              //         CarType(url: "assets/rari.jpeg", text: "Ferrari"),
              //         CarType(url: "assets/bentley.jpeg", text: "Bentely"),
              //       ],
              //     )
              //     :
              SizedBox(
                height: 500,

                child: GridView.builder(
                  itemCount: items.SelectedItem!.images.length,
                  itemBuilder:
                      (context, index) => Image.file(
                        items.SelectedItem!.images[index],
                        height: 200,
                        width: 200,
                        fit: BoxFit.cover,
                      ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: const [
              //     CarType(url: "assets/porsche.jpeg", text: "Porsche"),
              //   ],
              // ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.directions_car, color: Colors.white),
      ),
    );
  }
}
