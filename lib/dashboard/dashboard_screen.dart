import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_1/add_item/item.dart';
import 'package:section_1/add_item/item_model.dart';
import 'package:section_1/details/details_screen/details_page.dart';

import '../Profile/profile_page/profile_page.dart';
import '../Profile/profile_widgets/user_model.dart';
import '../add_item/add_item_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
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
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
        ),
        itemCount: items.items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              items.selectItem(
                Item(
                  images: items.items[index].images,
                  title: items.items[index].title,
                  body: items.items[index].body,
                  favourite: items.items[index].favourite,
                ),
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DetailsPage()),
              );
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.file(
                    items.items[index].images.first,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 8),
                  Text(
                    items.items[index].title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton.filledTonal(
                      onPressed: () {},
                      icon: Icon(Icons.favorite),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: (FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddItemScreen()),
          );
        },
      )),
    );
  }
}
