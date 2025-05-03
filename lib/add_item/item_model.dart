import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:section_1/add_item/item.dart';

class ItemModel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;
  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  ImagePicker imagePicker = ImagePicker();

  List<File>? SelectedImage = [];

  Future<void> imageSelector() async {
    List<XFile>? images = await imagePicker.pickMultiImage();
    if (images != null) {
      {
        SelectedImage!.addAll(
          images.map((toElement) => File(toElement!.path)).toList(),
        );
        // SelectedImage = File(image!.path);
      }

      notifyListeners();
    }
  }

  void removeImage(index) {
    SelectedImage!.removeAt(index);
    notifyListeners();
  }

  Item? _SelectedItem;
  Item? get SelectedItem => _SelectedItem!;

  void selectItem(Item item) {
    _SelectedItem = item;
    notifyListeners();
  }
}
