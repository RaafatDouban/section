import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:section_1/add_item/item_model.dart';

import '../../favourite/favourite_model.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemModel>(
      builder: (context, itemModel, child) {
        final currentItem = itemModel.items[index];
        final fav = Provider.of<FavouriteModel>(context, listen: true);
        return IconButton(
          onPressed: () {
            fav.isFavourite(currentItem);
          },
          icon: Icon(
            Icons.favorite,
            color: currentItem.favourite ? Colors.red : Colors.grey,
          ),
        );
      },
    );
  }
}
