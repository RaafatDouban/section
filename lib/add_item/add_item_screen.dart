import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:section_1/add_item/item.dart' show Item;
import 'package:section_1/add_item/item_model.dart';
import 'package:section_1/dashboard/dashboard_screen.dart';
import 'package:section_1/details/details_screen/details_page.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  void dispose() {
    title.dispose();
    body.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) {
            final itemModel = Provider.of<ItemModel>(context, listen: false);
            return IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder:
                        (context) => DetailsPage(
                          title: title.text,
                          body: body.text,
                          image: itemModel.SelectedImage,
                        ),
                  ),
                );
              },
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
        child: Consumer<ItemModel>(
          builder:
              (context, itemModel, child) => ListView(
                children: [
                  SizedBox(height: 150),
                  itemModel.SelectedImage!.isEmpty
                      ? Container(
                        color: Colors.white38,
                        height: 90,
                        width: MediaQuery.sizeOf(context).width - 20,
                        child: IconButton(
                          onPressed: () {
                            itemModel.imageSelector();
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
                                itemModel.imageSelector();
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
                                  itemModel.SelectedImage!
                                      .map(
                                        (toElement) => Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                itemModel.removeImage(
                                                  itemModel.SelectedImage!
                                                      .indexOf(toElement),
                                                );
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, right: 16.0),
        child: FloatingActionButton(
          child: Icon(Icons.save),
          onPressed: () {
            if (title.text.isEmpty || body.text.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Please fill in both title and body.")),
              );
              return;
            }

            final item = Provider.of<ItemModel>(context, listen: false);
            item.addItem(
              Item(
                title: title.text,
                body: body.text,
                images: List.from(item.SelectedImage!),
                favourite: false,
              ),
            );
            item.SelectedImage!.clear();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => DashboardScreen()),
            );
          },
        ),
      ),
    );
  }
}
